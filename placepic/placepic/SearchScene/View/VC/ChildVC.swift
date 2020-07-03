import UIKit
import XLPagerTabStrip

class ChildVC: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet var placeListTV: UITableView!
    var childNumber: String = ""
    
    let label: UILabel = {
        let l = UILabel()
        
        return l
        
    }()
    
    var palceTag1: [String] = ["분위기좋은","분위기좋은","분위기좋은"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeListTV.delegate = self
        placeListTV.dataSource = self
        sizeHeaderToFit(tableView: placeListTV)
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
}

extension ChildVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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

