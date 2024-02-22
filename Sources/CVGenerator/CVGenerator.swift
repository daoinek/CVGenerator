// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit


public enum CVItemCategoryType {
    case Project
    case Experience
    case Hobby
    case Education
}


public protocol CVGeneratorProtocol {
    func generate(for cv: Int, manager: CVManagerProtocol, _ callback: @escaping(Data?) -> Void)
}


public final class CVGeneratorModule {
    
    public static var manager = CVConfigurator()
    public static var generator = CVGenerator()

    
}


public class CVGenerator: CVGeneratorProtocol {
    
    private var manager: CVManagerProtocol!
    
    public func generate(for cv: Int, manager: CVManagerProtocol, _ callback: @escaping(Data?) -> Void) {
        self.manager = manager
        newCV(for: cv) { data in
            callback(data)
        }
    }
    
    
    private func newCV(for index: Int,_ callback: @escaping(Data?) -> Void) {
        switch index {
        case 0: getCV1 { callback($0) }
        case 1: getCV2 { callback($0) }
        case 2: getCV3 { callback($0) }
        case 3: getCV4 { callback($0) }
        case 4: getCV5 { callback($0) }
        case 5: getCV6 { callback($0) }
        default: break
        }
    }
    
    
    private func getCV1(_ callback: @escaping(Data?) -> Void) {
        let cvView = Resume1().fromXib() as! Resume1
        cvView.manager = manager
        cvView.generate { data in callback(data) }
    }
    
    private func getCV2(_ callback: @escaping(Data?) -> Void) {
        let cvView = Resume2().fromXib() as! Resume2
        cvView.manager = manager
        cvView.generate { data in callback(data) }
    }
    
    private func getCV3(_ callback: @escaping(Data?) -> Void) {
        let cvView = Resume3().fromXib() as! Resume3
        cvView.manager = manager
        cvView.generate { data in callback(data) }
    }
    
    private func getCV4(_ callback: @escaping(Data?) -> Void) {
        let cvView = Resume4().fromXib() as! Resume4
        cvView.manager = manager
        cvView.generate { data in callback(data) }
    }
    
    private func getCV5(_ callback: @escaping(Data?) -> Void) {
        let cvView = Resume5().fromXib() as! Resume5
        cvView.manager = manager
        cvView.generate { data in callback(data) }
    }
    
    private func getCV6(_ callback: @escaping(Data?) -> Void) {
        let cvView = Resume6().fromXib() as! Resume6
        cvView.manager = manager
        cvView.generate { data in callback(data) }
    }
    
}


extension UIView {
    
    func fromXib() -> UIView {
        let name = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: name, bundle: Bundle(for: type(of: self)))
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func generatePDFFromCurrentView() -> Data? {
        let pdfPageFrame = self.bounds
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, pdfPageFrame, nil)
        UIGraphicsBeginPDFPageWithInfo(pdfPageFrame, nil)
        let pdf = getPDF(from: pdfData)
        return pdf
    }
    
    
    private func getPDF(from pdfData: NSMutableData) -> Data? {
        guard let pdfContext = UIGraphicsGetCurrentContext() else { return nil }
        self.layer.render(in: pdfContext)
        UIGraphicsEndPDFContext()
        let data = NSData(data: pdfData as Data)
        return Data(referencing: data)
    }
}


class UIViewExtensions {
    
    enum ViewRadiusType {
        case onlyTop
        case onlyBottom
        case all
    }
    
    
    static func round(view: UIView?, _ type: ViewRadiusType = .all, radius: CGFloat) {
        view?.layer.cornerRadius = radius
        switch type {
        case .onlyBottom: view?.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .onlyTop: view?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .all: view?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
        view?.layer.masksToBounds = true
    }
    
    
    static func border(view: UIView, radius: CGFloat, color: UIColor) {
        view.layer.cornerRadius = radius
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = 1
        view.layer.masksToBounds = true
    }
    
    
    static func shadow(view: UIView, radius rad: CGFloat) {
        view.layer.cornerRadius = rad
        view.layer.shadowOpacity = 0.15
        view.layer.shadowRadius = rad
        view.layer.shadowRadius = 4
        view.layer.shadowColor = UIColor.black.cgColor
    }
    
}
