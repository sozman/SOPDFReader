import UIKit

struct SOPDFReader {
    var text = "Hello, World!"
}

public class test: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init() {
        let storyboardBundle = Bundle(for: test.self)
        super.init(nibName: "SOPDFReader", bundle: storyboardBundle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
