import UIKit
import XLPagerTabStrip

class ChildVC: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet var placeListTV: UITableView!
    var childNumber: String = ""
    var sum:Int = 12
    @IBOutlet var sumNum: UILabel!
    var placeList: [placeData] = []
    
//    
//    var palceTag1: [String] = ["공부하기좋은","분위기좋은","분위기좋은"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeListTV.delegate = self
        placeListTV.dataSource = self
        setNavigationBar()
        setData()
        getData()
        
//        sizeHeaderToFit(tableView: placeListTV)
//        let headerViewHeight: CGFloat = 30.0
//        let headerView = HeaderView(frame: CGRect(x: textView.bounds.origin.x, y: textView.bounds.origin.y - headerViewHeight, width: textView.bounds.size.width, height: headerViewHeight))
//        textView.addSubview(headerView)
//        textView.contentInset.top = headerViewHeight
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
            placeService.shared.getPlaces() { networkResult in
                switch networkResult {
                case .success(let products):
                    print("~!@@#!@#")
                    guard let places = products as? [placeData] else { return }
                    for i in 0..<places.count{
                        self.placeList.append(places[i])
//                        print(self.placeList[i])
                    }
                    self.placeListTV.reloadData()
                    self.sumNum.text = "총 \(self.placeList.count)개 결과"
                case .requestErr(let message):
                    guard let message = message as? String else { return }
                    let alertViewController = UIAlertController(title: "조회 실패", message: message, preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                    alertViewController.addAction(action)
                    self.present(alertViewController, animated: true, completion: nil)
                case .pathErr: print("path")
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
    func setData(){
//        sumNum.text = "총 \(placeList.count)개 결과"
    }
}

extension ChildVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
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
        for i in 0..<placeList[indexPath.row].subway.count{
            if i == (placeList[indexPath.row].subway.count-1){
                dataInfo = dataInfo + placeList[indexPath.row].subway[i].subwayName + "역"
            }
            else {
                 dataInfo = dataInfo + placeList[indexPath.row].subway[i].subwayName + "/"
            }
        }
        
        let date:Date = Date(timeIntervalSince1970: TimeInterval(placeList[indexPath.row].placeCreatedAt))

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        if placeList[indexPath.row].tag.count == 0{
            dataInfo = dataInfo + " · " + dateFormatter.string(from: date)
        }
        else{
            dataInfo = dataInfo + dateFormatter.string(from: date)
        }
        print(dataInfo)
        
        if placeList[indexPath.row].tag.count == 0 {
            placeListCell.setPlaceInfo(pName: placeList[indexPath.row].placeName, pSubway: dataInfo, pPhoto: "", pWriter: "", wName: placeList[indexPath.row].user.userName, pTag1: "", pTag2: "", pTag3: "")
            placeListCell.placeTag[0].isHidden = true
            placeListCell.placeTag[1].isHidden = true
            placeListCell.placeTag[2].isHidden = true
        }
        else if placeList[indexPath.row].tag.count == 1 {
            placeListCell.setPlaceInfo(pName: placeList[indexPath.row].placeName, pSubway: dataInfo, pPhoto: "", pWriter: "", wName: placeList[indexPath.row].user.userName, pTag1: placeList[indexPath.row].tag[0].tagName, pTag2: placeList[indexPath.row].tag[1].tagName, pTag3: "")
            placeListCell.placeTag[1].isHidden = true
            placeListCell.placeTag[2].isHidden = true
        }
        else if placeList[indexPath.row].tag.count == 2 {
            placeListCell.setPlaceInfo(pName: placeList[indexPath.row].placeName, pSubway: dataInfo, pPhoto: "", pWriter: "", wName: placeList[indexPath.row].user.userName, pTag1: placeList[indexPath.row].tag[0].tagName, pTag2: placeList[indexPath.row].tag[1].tagName, pTag3: "")
            placeListCell.placeTag[2].isHidden = true
        }
        else if placeList[indexPath.row].tag.count >= 3 {
            placeListCell.setPlaceInfo(pName: placeList[indexPath.row].placeName, pSubway: dataInfo, pPhoto: "", pWriter: "", wName: placeList[indexPath.row].user.userName, pTag1: placeList[indexPath.row].tag[0].tagName, pTag2: placeList[indexPath.row].tag[1].tagName, pTag3: "...")
        }
        return placeListCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

