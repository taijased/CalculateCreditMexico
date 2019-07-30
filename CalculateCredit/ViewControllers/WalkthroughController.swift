

import UIKit
import paper_onboarding

class WalkthroughController: UIViewController {
    
    @IBOutlet var skipButton: UIButton!
    
    fileprivate let items = [
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "house"),
                           title: "Hipoteca",
                           description: "Ofrecemos a Jn el préstamo hipotecario-con la tasa de interés, el pago mensual, la descripción de los beneficios.",
                           pageIcon: #imageLiteral(resourceName: "maracas"),
                           color: UIColor(hexValue: "#5D20A2", alpha: 1)!,
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "automobile"),
                           title: "Coche",
                           description: "¡El crédito correcto para el coche, y montarlo por diversión!",
                           pageIcon: #imageLiteral(resourceName: "maracas"),
                           color: UIColor(hexValue: "#5DDDD3", alpha: 1)!,
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        OnboardingItemInfo(informationImage: #imageLiteral(resourceName: "presentation"),
                           title: "Negocio",
                           description: "El negocio requiere muchos cálculos. Por lo tanto, Jn el préstamo correcto para su negocio.",
                           pageIcon: #imageLiteral(resourceName: "maracas"),
                           color: UIColor(hexValue: "#53B7F5", alpha: 1)!,
                           titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skipButton.isHidden = true
        
        setupPaperOnboardingView()
        
        view.bringSubviewToFront(skipButton)
    }
    
    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        
        // Add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
    }
}

// MARK: Actions

extension WalkthroughController {
    
    @IBAction func skipButtonTapped(_: UIButton) {
        print(#function)
    }
}

// MARK: PaperOnboardingDelegate

extension WalkthroughController: PaperOnboardingDelegate {
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        skipButton.isHidden = index == 2 ? false : true
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
        // configure item
        
        //item.titleLabel?.backgroundColor = .redColor()
        //item.descriptionLabel?.backgroundColor = .redColor()
        //item.imageView = ...
    }
}

// MARK: PaperOnboardingDataSource

extension WalkthroughController: PaperOnboardingDataSource {
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        return items[index]
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
}


//MARK: Constants
private extension WalkthroughController {
    
    static let titleFont = UIFont(name: "TTNorms-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
    static let descriptionFont = UIFont(name: "TTNorms-Bold", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
}

