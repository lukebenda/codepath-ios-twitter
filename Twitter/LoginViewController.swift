// 9/21/22

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        // Use Post OAuth/request_token to login
        let myUrl = "https://api.twitter.com/oauth/request_token"
                TwitterAPICaller.client?.login(url: myUrl, success: {
                    UserDefaults.standard.set(true, forKey: "userLoggedIn")
                    self.performSegue(withIdentifier: "loginToHome", sender: self)
                }, failure: { (Error) in
                    print("Could not log in!")
                })
            }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
