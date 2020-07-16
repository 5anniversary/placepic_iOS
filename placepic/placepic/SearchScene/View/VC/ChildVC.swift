import UIKit
import Kingfisher
import XLPagerTabStrip
import Alamofire

extension Notification.Name {
    ///Delegate Closure Notification
    
    static let changeChildViewVC = Notification.Name("changechildviewVC")
}
//placeDetailVC
class ChildVC: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet var placeListTV: UITableView!
    var childNumber: String = ""
    @IBOutlet var sumNum: UILabel!
    var placeList: placeListClass?
    var placeListData: [placeData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeListTV.delegate = self
        placeListTV.dataSource = self
        setNavigationBar()
        getData()
    
        
//        
//        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "placeDetailVC") as! placeDetailVC
//        self.navigationController?.pushViewController(secondViewController, animated: true)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.post(name: .changeChildViewVC, object: nil, userInfo: ["childNumber": childNumber])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "\(childNumber)")
    }
    
    func textFieldDidChange(sender: UITextField) {
        sender.invalidateIntrinsicContentSize()
    }
    func getData(){
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
        
        placeService.shared.getPlaces(urlString){ networkResult in
            switch networkResult {
            case .success(let products):
                guard let places = products as? placeListClass else { return }
                for i in 0..<places.result.count{
                    self.placeListData.append(places.result[i])
                }
                self.placeListTV.reloadData()
                self.sumNum.text = "총 \(self.placeListData.count)개 결과"
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "조회 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("pathErr")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
                
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
        guard let placeListCell = tableView.dequeueReusableCell(withIdentifier: PlaceListTVC.identifier, for: indexPath) as? PlaceListTVC else { return UITableViewCell() }
        var dataInfo: String = ""
        var subwayInfo: String = ""
        
        for i in 0..<placeListData[indexPath.row].subway.count{
            if i == (placeListData[indexPath.row].subway.count-1){
                subwayInfo = subwayInfo + placeListData[indexPath.row].subway[i].subwayName
            }
            else {
                subwayInfo = subwayInfo + placeListData[indexPath.row].subway[i].subwayName + "/"
            }
        }
        
        let date:Date = Date(timeIntervalSince1970: TimeInterval(placeListData[indexPath.row].placeCreatedAt))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        if placeListData[indexPath.row].tag.count == 0 {
            dataInfo = dataInfo + dateFormatter.string(from: date)
        }
        else{
            dataInfo = dataInfo + " · " + dateFormatter.string(from: date)
        }
        
        
        var tags:[String] = []
        for i in 0..<placeListData[indexPath.row].tag.count{
            if placeListData[indexPath.row].tag[i].tagIsBasic == 0{
                tags.append(placeListData[indexPath.row].tag[i].tagName)
            }
        }
        
        if tags.count == 0 {
            placeListCell.setPlaceInfo(pName: placeListData[indexPath.row].placeName, pSubway: subwayInfo,pDate: dataInfo, pPhoto: placeListData[indexPath.row].imageURL[0], pWriter: placeListData[indexPath.row].user.profileURL, wName: placeListData[indexPath.row].user.userName, pTag1: "", pTag2: "", pTag3: "")
            placeListCell.placeTag[0].isHidden = true
            placeListCell.placeTag[1].isHidden = true
            placeListCell.placeTag[2].isHidden = true
        }
        else if tags.count == 1 {
            placeListCell.setPlaceInfo(pName: placeListData[indexPath.row].placeName, pSubway: subwayInfo, pDate: dataInfo, pPhoto: placeListData[indexPath.row].imageURL[0], pWriter: placeListData[indexPath.row].user.profileURL, wName: placeListData[indexPath.row].user.userName, pTag1: tags[0], pTag2: "", pTag3: "")
            placeListCell.placeTag[1].isHidden = true
            placeListCell.placeTag[2].isHidden = true
        }
        else if tags.count == 2 {
            placeListCell.setPlaceInfo(pName: placeListData[indexPath.row].placeName, pSubway: subwayInfo,pDate: dataInfo, pPhoto: placeListData[indexPath.row].imageURL[0], pWriter: placeListData[indexPath.row].user.profileURL, wName: placeListData[indexPath.row].user.userName, pTag1: tags[0], pTag2: tags[1], pTag3: "")
            placeListCell.placeTag[2].isHidden = true
        }
        else if tags.count > 2 {
            placeListCell.setPlaceInfo(pName: placeListData[indexPath.row].placeName, pSubway: subwayInfo,pDate: dataInfo, pPhoto: placeListData[indexPath.row].imageURL[0], pWriter: placeListData[indexPath.row].user.profileURL, wName: placeListData[indexPath.row].user.userName, pTag1: tags[0], pTag2: tags[1], pTag3: "...")
        }
        
        return placeListCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}



