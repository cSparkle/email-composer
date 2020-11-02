import Foundation
import Capacitor
import MessageUI.MFMailComposeViewController

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(EmailComposer)
public class EmailComposer: CAPPlugin {

    @objc func mailAvailable() -> Bool {
        return MFMailComposeViewController.canSendMail()
    }
    
    @objc func openEmail(_ call: CAPPluginCall) {
        if (mailAvailable()) {
            DispatchQueue.main.async {
                self.openViewController(call)
            }
        }
    }
    
    @objc func openViewController(_ call: CAPPluginCall) {
        let to = call.getString("to") ?? ""
        let subject = call.getString("subject") ?? ""
        let body = call.getString("body") ?? ""
        
        
        let composeViewController = MFMailComposeViewController()
        composeViewController.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
        
        composeViewController.setToRecipients([to])
        composeViewController.setSubject(subject)
        composeViewController.setMessageBody(body, isHTML: false)
        DispatchQueue.main.async {
            self.bridge.viewController.present(composeViewController, animated: true, completion: nil)
        }
    }
}
