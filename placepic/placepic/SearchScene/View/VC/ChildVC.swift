import UIKit
import Kingfisher
import XLPagerTabStrip
import Alamofire

extension Notification.Name {
    ///Delegate Closure KVO Notification
    ///Map reduce Filter
    static let changeChildViewVC = Notification.Name("changechildviewVC")
}

//placeDetailVC
class ChildVC: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet var placeListTV: UITableView!
    var childNumber: String = ""
    @IBOutlet var sumNum: UILabel!
    var placeList: placeListClass?
    var placeListData: [placeData] = []
    
    var keyword: [Int] = []
    var useful: [Int] = []
    
    var subwayquery: String = ""
    var keywordquery: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeListTV.delegate = self
        placeListTV.dataSource = self
        setNavigationBar()
        getData()
        addObserver()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.post(name: .changeChildViewVC, object: nil, userInfo: ["childNumber": childNumber])
    }
    
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keywordNotification), name: .homeModalKeywordNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(usefulNotification(_:)), name: .homeModalUsefulNotification, object: nil)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(childNumber)")
    }
    
    func textFieldDidChange(sender: UITextField) {
        sender.invalidateIntrinsicContentSize()
    }
    
    func getData() {
        
        var urlString: String = ""
        if childNumber == "맛집" {
            urlString = "?categoryIdx=1"
        }
        else if childNumber == "술집" {
            urlString = "?categoryIdx=2"
        }
        else if childNumber == "카페" {
            urlString = "?categoryIdx=3"
        }
        else if childNumber == "스터디" {
            urlString = "?categoryIdx=4"
        }
        else if childNumber == "기타" {
            urlString = "?categoryIdx=5"
        }
        
        print(#function)
        placeService.shared.getPlaces(keywordquery, subwayquery) { data in
            if let metaData = data {
                let LargeData = metaData
                guard let datum = LargeData.result else { return }
                //                print("datum: \(datum)\n")
                self.placeListData = datum
                self.placeListTV.reloadData()
                self.sumNum.text = "총 \(self.placeListData.count)개 결과"
            }
        }
    }
    
    @objc private func keywordNotification(_ notification: NSNotification) {
        guard let injectedModel = notification.userInfo?["indexPath.item"] as? [Int] else { return }
        keyword = injectedModel
        /// `1. 버튼 색 변경`
        /// `2. 라벨 변경`
        /// `3. 쿼리스트링 Int >> `
        if keyword.count != 0 {
            NotificationCenter.default.post(name: .searchKeywordNotification, object: self, userInfo: ["searchKeyword": keyword])
            var word = ""
            
            for i in 0..<keyword.count {
                if i == keyword.count-1 {
                    word = word + String(describing: keyword[i])
                } else {
                    word = word + String(describing: keyword[i]) + ","

                }
            }
            print("keyword : \(word)")
            placeService.shared.getPlaces(word, subwayquery) { data in
                if let metaData = data {
                    
                    let LargeData = metaData
                    guard let datum = LargeData.result else { return }
                    print("datum: \(datum.count)\n")
                    self.placeListData = datum
                    self.placeListTV.reloadData()
                    self.sumNum.text = "총 \(self.placeListData.count)개 결과"
                }
            }
        } else {
            placeService.shared.getPlaces(keywordquery, subwayquery) { data in
                 if let metaData = data {
                     
                     let LargeData = metaData
                     guard let datum = LargeData.result else { return }
                     print("datum: \(datum.count)\n")
                     self.placeListData = datum
                     self.placeListTV.reloadData()
                     self.sumNum.text = "총 \(self.placeListData.count)개 결과"
                 }
             }
        }
    }
    
    @objc private func usefulNotification(_ notification: NSNotification) {
        guard let injectedModel = notification.userInfo?["indexPath.item"] as? [Int] else { return }
        useful = injectedModel
        
       if useful.count != 0 {
        NotificationCenter.default.post(name: .searchUsefulNotification, object: self, userInfo: ["searchuseful": useful])
            var word = ""
            
            for i in 0..<useful.count {
                if i == useful.count-1 {
                    word = word + String(describing: useful[i])
                } else {
                    word = word + String(describing: useful[i]) + ","
                }
            }
            print("keyword : \(word)")
            
            placeService.shared.getPlaces(word, subwayquery) { data in
                if let metaData = data {
                    
                    let LargeData = metaData
                    guard let datum = LargeData.result else { return }
                    //                print("datum: \(datum)\n")
                    self.placeListData = datum
                    self.placeListTV.reloadData()
                    self.sumNum.text = "총 \(self.placeListData.count)개 결과"
                }
            }
        } else {
            placeService.shared.getPlaces(keywordquery, subwayquery) { data in
                 if let metaData = data {
                     
                     let LargeData = metaData
                     guard let datum = LargeData.result else { return }
                     print("datum: \(datum.count)\n")
                     self.placeListData = datum
                     self.placeListTV.reloadData()
                     self.sumNum.text = "총 \(self.placeListData.count)개 결과"
                 }
             }
        }
    }
    private func setNavigationBar() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        let leftButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "backArrowIc"),
                                                          style: .plain,
                                                          target: self,
                                                          action: #selector(dismissVC))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    @objc private func dismissVC() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension ChildVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeListData.count
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let index = placeListTV.indexPathForSelectedRow {
            placeListTV.deselectRow(at: index, animated: true)
        }
    }
    
    //placeDetailVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toDetailVC" {
            if let destination = segue.destination as? placeDetailVC {
                if let selectedIndex = self.placeListTV.indexPathsForSelectedRows?.first?.row {
                    destination.selectIdx = placeListData[selectedIndex].placeIdx
                }
            }
        }
    }
    
    func sizeHeaderToFit(tableView: UITableView) {
        if let headerView = placeListTV.tableHeaderView {
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var frame = headerView.frame
            frame.size.height = height
            headerView.frame = frame
            tableView.tableHeaderView = headerView
            headerView.setNeedsLayout()
            headerView.layoutIfNeeded()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        guard let placeListCell = tableView.dequeueReusableCell(withIdentifier: PlaceListTVC.identifier, for: indexPath) as? PlaceListTVC else { return UITableViewCell() }
        
        var dataInfo: String = ""
        var subwayInfo: String = ""
        //        let placeData = placeListData
        
        guard let subway = placeListData[indexPath.row].subway else {
            return UITableViewCell()
        }
        print("@@@")
//        print(placeListData)
//        print("subway : \(subway)\n")

        if subway.count != 0 {
            for i in 0..<subway.count {
                guard let name = subway[i].subwayName else { return UITableViewCell() }
                subwayInfo = subwayInfo + name
                
                //                if i == subway.count-1 {
                //                    subwayInfo = subwayInfo + name
                //                }
                //                else {
                //                    subwayInfo = subwayInfo + subway[i].subwayName! + "/"
                //                    //                subwayInfo = subwayInfo + placeListData[indexPath.row].subway[i].subwayName + "/"
                //                }
            }
        }
        
        let date:Date = Date(timeIntervalSince1970: TimeInterval(placeListData[indexPath.row].placeCreatedAt!))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        if placeListData[indexPath.row].tag?.count == 0 {
            dataInfo = dataInfo + dateFormatter.string(from: date)
        }
        else{
            dataInfo = dataInfo + " · " + dateFormatter.string(from: date)
        }
        
        var tags:[String] = []
        for i in 0..<placeListData[indexPath.row].tag!.count{
            tags.append((placeListData[indexPath.row].tag?[i].tagName)!)
        }
        
        if tags.count == 0 {
            placeListCell.setPlaceInfo(pName: placeListData[indexPath.row].placeName!, pSubway: subwayInfo, pDate: dataInfo, pPhoto: (placeListData[indexPath.row].imageURL?[0])!, pWriter: (placeListData[indexPath.row].user?.profileURL)!, wName: (placeListData[indexPath.row].user?.userName)!, pTag1: "", pTag2: "", pTag3: "")
            placeListCell.placeTag[0].isHidden = true
            placeListCell.placeTag[1].isHidden = true
            placeListCell.placeTag[2].isHidden = true
        }
        else if tags.count == 1 {
            placeListCell.setPlaceInfo(pName: placeListData[indexPath.row].placeName!, pSubway: subwayInfo, pDate: dataInfo, pPhoto: (placeListData[indexPath.row].imageURL?[0])!, pWriter: (placeListData[indexPath.row].user?.profileURL)!, wName: (placeListData[indexPath.row].user?.userName)!, pTag1: tags[0], pTag2: "", pTag3: "")
            placeListCell.placeTag[1].isHidden = true
            placeListCell.placeTag[2].isHidden = true
        }
        else if tags.count == 2 {
            placeListCell.setPlaceInfo(pName: placeListData[indexPath.row].placeName!, pSubway: subwayInfo, pDate: dataInfo, pPhoto: (placeListData[indexPath.row].imageURL?[0])!, pWriter: (placeListData[indexPath.row].user?.profileURL)!, wName: (placeListData[indexPath.row].user?.userName)!, pTag1: tags[0], pTag2: tags[1], pTag3: "")
            placeListCell.placeTag[2].isHidden = true
        }
        else if tags.count > 2 {
            placeListCell.setPlaceInfo(pName: placeListData[indexPath.row].placeName!, pSubway: subwayInfo, pDate: dataInfo, pPhoto: (placeListData[indexPath.row].imageURL?[0])!, pWriter: (placeListData[indexPath.row].user?.profileURL)!, wName: (placeListData[indexPath.row].user?.userName)!, pTag1: tags[0], pTag2: tags[1], pTag3: "...")
        }
        return placeListCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}



