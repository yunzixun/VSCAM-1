
import UIKit
import SDWebImage

class AboutController: BaseViewController {

    var tableView: AboutTableView!
    var model: AboutModel!

    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(valueRGB: 0xF8F8F8)

        addModel()
        addControls()
    }

    func addModel() {
        model = AboutModel()
    }

    func addControls() {
        //buttons
        if let _ = self.view.viewWithTag(Tag.make(0)) as? UIImageView {

        } else {
            let view = UIImageView()
            view.contentMode = .center
            view.image = R.image.按钮_返回_黑()
            view.tag = Tag.make(0)
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(
                UITapGestureRecognizer(target: self, action: #selector(AboutController.backClicked))
            )
            self.view.addSubview(view)
            view.snp.makeConstraints {
                (make) -> Void in
                make.top.left.equalTo(0)
                make.width.height.equalTo(55)
            }
        }

        //addTableView
        if let _ = self.view.viewWithTag(Tag.make(1)) as? AboutTableView {

        } else {
            let view = AboutTableView(self)
            view.tag = Tag.make(1)
            self.view.addSubview(view)
            view.snp.makeConstraints {
                (make) -> Void in
                make.top.left.right.bottom.equalTo(0)
            }
            self.view.sendSubview(toBack: view)
            self.tableView = view
        }
    }

    @objc func backClicked() {
        MainNavigationController.sharedInstance.popViewController(animated: true)
    }

    @objc func scoreClicked() {
        if let tryUrl = URL(myString: NetworkURL.appStore) {
            UIApplication.shared.openURL(tryUrl)
        }
    }

    @objc func welcomeClicked() {
        MainNavigationController.sharedInstance.pushViewController(EFOpenController(), animated: true)
    }

    @objc func privacyClicked() {
        if let tryUrl = URL(myString: NetworkURL.privacy) {
            UIApplication.shared.openURL(tryUrl)
        }
    }

    @objc func vscamClicked() {
        if let tryUrl = URL(myString: NetworkURL.vscam) {
            UIApplication.shared.openURL(tryUrl)
        }
    }
}
