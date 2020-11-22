import Foundation
import Capacitor
import MessageUI.MFMailComposeViewController

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(EmailComposer)
public class EmailComposer: CAPPlugin, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {

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
        let recipients = call.getArray("to", String.self) ?? []
        let subject = call.getString("subject") ?? ""
        let body = call.getString("body") ?? ""
        
        
        let draft = MFMailComposeViewController()
        draft.mailComposeDelegate = self;
        
        draft.setToRecipients(recipients)
        draft.setSubject(subject)
        draft.setMessageBody(body, isHTML: false)
        DispatchQueue.main.async {
            self.bridge.viewController.present(draft, animated: true, completion: nil)
        }
    }
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
