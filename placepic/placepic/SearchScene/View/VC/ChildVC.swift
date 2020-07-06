import UIKit
import XLPagerTabStrip

class ChildVC: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet var placeListTV: UITableView!
    var childNumber: String = ""
    var sum:Int = 12
    @IBOutlet var sumNum: UILabel!
    
    
    var palceTag1: [String] = ["공부하기좋은","분위기좋은","분위기좋은"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeListTV.delegate = self
        placeListTV.dataSource = self
        setNavigationBar()
        setData()
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
        sumNum.text = "총 \(sum)개 결과"
    }
}

extension ChildVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
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
        if palceTag1.count == 1 {
            placeListCell.setPlaceInfo(pName: "무대륙", pSubway: "합정역", pPhoto: "", pWriter: "", wName: "김정재", pTag1: palceTag1[0], pTag2: "", pTag3: "")
            placeListCell.placeTag[1].isHidden = true
            placeListCell.placeTag[2].isHidden = true
        }
        else if palceTag1.count == 2 {
            placeListCell.setPlaceInfo(pName: "무대륙", pSubway: "합정역", pPhoto: "", pWriter: "", wName: "김정재", pTag1: palceTag1[0], pTag2: palceTag1[1], pTag3: "")
            placeListCell.placeTag[2].isHidden = true
        }
        else if palceTag1.count == 3 {
            placeListCell.setPlaceInfo(pName: "무대륙", pSubway: "합정역", pPhoto: "", pWriter: "", wName: "김정재", pTag1: palceTag1[0], pTag2: palceTag1[1], pTag3: "...")
        }
        return placeListCell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

