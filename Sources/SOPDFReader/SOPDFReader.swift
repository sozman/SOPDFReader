import UIKit
import SnapKit

public class SOPDFReader {
    public static func createModule(pdfLink: String) -> UIViewController {
        return SOPDFReaderController(pdfLink: pdfLink)
    }
}

class SOPDFReaderController: UIViewController {
    
    var pdfController: EPDFViewController?
    
    var optionView = UIView()
    var pageLabel = UILabel()
    var pageSlider = UISlider()
    
    init(pdfLink: String) {
        super.init(nibName: nil, bundle: nil)
        pdfController = EPDFViewController(fileURL: URL(string: pdfLink)!, hasCoverPage: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        pdfController?.delegate = self
        setupOptionView()
        setupPDF()
        setupLabel()
        setupSlider()
    }
    
    private func setupOptionView() {
        self.view.addSubview(optionView)
        optionView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-25)
            make.left.equalTo(self.view.snp.left).offset(15)
            make.right.equalTo(self.view.snp.right).offset(-15)
            make.height.equalTo(85)
        }
        optionView.backgroundColor = UIColor.white
        optionView.layer.zPosition = 1
        optionView.layer.cornerRadius = 15
    }
    
    private func setupPDF() {
        self.addChild(pdfController!)
        view.addSubview((pdfController?.view)!)
        
        pdfController?.view.snp.makeConstraints({ (make) in
            make.top.equalTo(self.view)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.optionView.snp.top).offset(-5)
        })
        
        pdfController?.didMove(toParent: self)
    }
    
    private func setupLabel() {
        self.optionView.addSubview(self.pageLabel)
        pageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(21)
        }
        pageLabel.textAlignment = .center
        let totalPage = pdfController?.pdfDocumentController.numberOfPages
        pageLabel.text = "Reading 1 / \(totalPage ?? 0)"
    }
    
    private func setupSlider() {
        self.optionView.addSubview(self.pageSlider)
        pageSlider.isUserInteractionEnabled = false
        let totalPage = pdfController?.pdfDocumentController.numberOfPages ?? 1
        pageSlider.maximumValue = Float(totalPage)
        pageSlider.minimumValue = 1
        pageSlider.addTarget(self, action: #selector(self.pageSliderValueDidChange(_:)), for: .valueChanged)
        pageSlider.snp.makeConstraints { (make) in
            make.top.equalTo(pageLabel.snp.bottom).offset(10)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-15)
        }
    }
    
    @objc func pageSliderValueDidChange(_ sender:UISlider!) {
    }

}

extension SOPDFReaderController: PDFViewControllerDelegate {
    func currentPage(page: Int?) {
        let totalPage = pdfController?.pdfDocumentController.numberOfPages
        pageLabel.text = "Reading \(page ?? 0) / \(totalPage ?? 0)"
        self.pageSlider.setValue(Float(page ?? 0), animated: true)
    }
}
