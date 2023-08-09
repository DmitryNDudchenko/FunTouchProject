//
//  ADSViewController.swift
//  FunTouch
//
//  Created by Дмитрий on 01.03.2023.
//

import UIKit
import GoogleMobileAds

class ADSViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var adsButton: UIButton!
    @IBOutlet weak var payButton: UIButton!

    struct Constants {
        static let homeAdID = "ca-app-pub-3940256099942544/5135589807"
    }

    private var interstitial: GADInterstitialAd?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)

        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID: Constants.homeAdID,
                                        request: request,
                              completionHandler: { [self] ad, error in
                                if let error = error {
                                  print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                  return
                                }
                                interstitial = ad
                                interstitial?.fullScreenContentDelegate = self
                              }
            )
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController!.navigationBar.isHidden = true
    }


    @IBAction func payButton(_ sender: UIButton) {
        let personVC = InteractiveView()
        navigationController?.pushViewController(personVC, animated: true)
    }

    @IBAction func adsButton(_ sender: UIButton) {
        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
            let personVC = InteractiveView()
            navigationController?.pushViewController(personVC, animated: true)
          } else {
            print("Ad wasn't ready")
          }
    }

    @IBAction func backButton(_ sender: UIButton) {
        let massageVC = MessageViewController()
        navigationController?.pushViewController(massageVC, animated: true)
    }
    @IBAction func personalMessButton(_ sender: UIButton) {
//        let personVC = personalViewController()
//        navigationController?.pushViewController(personVC, animated: true)
    }
    @IBAction func personalVC(_ sender: UIButton) {
                let personVC = personalHistoryViewController()
                navigationController?.pushViewController(personVC, animated: true)
    }

}

extension ADSViewController: GADFullScreenContentDelegate {

    /// Tells the delegate that the ad failed to present full screen content.
      func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
      }

      /// Tells the delegate that the ad will present full screen content.
      func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
      }

      /// Tells the delegate that the ad dismissed full screen content.
      func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
      }

}
