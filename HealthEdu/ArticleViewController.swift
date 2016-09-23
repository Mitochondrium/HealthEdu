//
//  ArticleViewController.swift
//  HealthEdu
//
//  Created by Mac on 2016/9/12.
//  Copyright © 2016年 NCKU_hospital. All rights reserved.
//

import UIKit
import CoreData

class ArticleViewController: UIViewController {
    
    // 變數定義區
    var currentIdString = ""
    var currentPhotoString = ""
    var currentDivisionString = ""
    var currentTitleString = ""
    var currentAuthorString = ""
    var currentBodyString = ""
    var currentTimeString = ""
    //這裡先宣告一些變數，注意這裡的名字會被使用在資料來源的vc
    
    
    @IBOutlet var articleFullWebView: UIWebView!
    
    // 以下為 qrcodeImage 變數
    var qrcodeImage: CIImage!
    
    // 以下這個也是要傳遞過來的變數
    var articleIdforQRCode :String? = "http://myelin.tk/for_ncku_app_test/"
    
    var fontSizeString :String?
    
    
    
    // 給 core data (儲存文章) 功能使用
    let core_data = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    

    
    
    
    
    
    
    // 產生 QR Code 按鈕 button func
    @IBAction func qrcodeBtn(sender: AnyObject) {
        let alertMessage = UIAlertController(title: "請使用QR Code掃描器掃描！", message: "點擊背景以返回", preferredStyle: .Alert)
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertMessage.view, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 320)
        
        alertMessage.view.addConstraint(height)
        
        
        
        let imageView = UIImageView(frame: CGRectMake(35, 90, 200, 200))
        
        imageView.image = self.GenerateQRCode(imageView)
        // 右邊產生 qrcode
        alertMessage.view.addSubview(imageView)
        
        //let action = UIAlertAction(title: "返回", style: .Default, handler: nil)
        
        //alertMessage.addAction(action)
        
        self.presentViewController(alertMessage, animated: true, completion:{
            alertMessage.view.superview?.userInteractionEnabled = true
            alertMessage.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
        })

    }
    
    // 改變文字大小 button func
    @IBAction func changeFontSize(sender: AnyObject) {
        
        
        
        let alertMessage = UIAlertController(title: "改變文字大小", message: "目前文字大小：\(self.fontSizeString!)", preferredStyle: .Alert)
        

        let sizeSmaller = UIAlertAction(title: "小", style: .Default, handler: { (action) -> Void in
            
            
            let script = "document.getElementById('body').style.fontSize = '19px'";
            if let result = self.articleFullWebView.stringByEvaluatingJavaScriptFromString(script) {
                print("result is \(result)")
            }
            self.fontSizeString = "小"
        })
        
        let sizeNormal = UIAlertAction(title: "正常", style: .Default, handler: { (action) -> Void in
            let script = "document.getElementById('body').style.fontSize = '21px'";
            if let result = self.articleFullWebView.stringByEvaluatingJavaScriptFromString(script) {
                print("result is \(result)")
            }
            self.fontSizeString = "正常"
        })
        
        let sizeBigger = UIAlertAction(title: "大", style: .Default, handler: { (action) -> Void in
            let script = "document.getElementById('body').style.fontSize = '24px'";
            if let result = self.articleFullWebView.stringByEvaluatingJavaScriptFromString(script) {
                print("result is \(result)")
            }
            self.fontSizeString = "大"
        })
        
        let sizeBiggest = UIAlertAction(title: "最大", style: .Default, handler: { (action) -> Void in
            let script = "document.getElementById('body').style.fontSize = '29px'";
            if let result = self.articleFullWebView.stringByEvaluatingJavaScriptFromString(script) {
                print("result is \(result)")
            }
            self.fontSizeString = "最大"
        })
        
        alertMessage.addAction(sizeSmaller)
        alertMessage.addAction(sizeNormal)
        alertMessage.addAction(sizeBigger)
        alertMessage.addAction(sizeBiggest)

        
        self.presentViewController(alertMessage, animated: true, completion:nil)
        // 若有點擊背景以返回功能，則會影響 alert 的 button 功能
        

    }
    
    // 顯示 article web view HTML
    func showarticleFullHTML(fontsize: Int){
        
        print("------顯示文章 文字大小 \(fontsize)-------")
        
        let photoSeparated:Array = currentPhotoString.componentsSeparatedByString(".")
        
        let photoPath :String? = NSBundle.mainBundle().pathForResource(photoSeparated[0], ofType: photoSeparated[1])
        
        
        let divWidth = self.view.frame.size.width-17
        let divHeight = 243
        let imgWidth = self.view.frame.size.width-17
        
        
        var articleFullHTMLarray = [String]()
        articleFullHTMLarray.append("<div width=\"\(divWidth)\" style=\"word-break: break-all;\"")
        
        
        articleFullHTMLarray.append("<br><p><div align=\"center\" style=\"font-size:35px; font-weight:bold;\">\(self.currentTitleString)</div></p>")
        articleFullHTMLarray.append("<p><div align=\"center\" style=\"color: gray; font-size:19px\">\(self.currentAuthorString)</div></p>")
        articleFullHTMLarray.append("<div align=\"center\" style=\"width:\(divWidth)px; height:\(divHeight)px; overflow:hidden;  \">")
        articleFullHTMLarray.append(NSString(format:"<img src=\"file://%@\" width=\"\(imgWidth)\">", photoPath!) as String)
        articleFullHTMLarray.append("</div>")
        articleFullHTMLarray.append("<div style='font-size: \(fontsize)px' id=\"body\"><p>\(self.currentBodyString)</p>")
        articleFullHTMLarray.append("<p>最後更新：\(self.currentTimeString)<br></p></div>")
        articleFullHTMLarray.append("</div>")
        

        let articleFullHTML = articleFullHTMLarray.joinWithSeparator("")
        
        self.fontSizeString = "正常"
        self.articleFullWebView.loadHTMLString(articleFullHTML, baseURL: nil)
        
    }
    
    // func 新增到書籤
    @IBAction func addToBookmark(sender: AnyObject) {
        
        
        if let bookmark = NSEntityDescription.insertNewObjectForEntityForName("BookmarkEntities", inManagedObjectContext: self.core_data) as? BookmarkEntities {
            bookmark.id = currentIdString
            bookmark.time = currentTimeString
            bookmark.author = currentAuthorString
            bookmark.body = currentBodyString
            bookmark.title = currentTitleString
            bookmark.photo = currentPhotoString
            bookmark.division = currentDivisionString

            do {
                
                try self.core_data.save()
                // 儲存
                
            }catch{
                
                fatalError("Failure to save context: \(error)")
                // 無法儲存
            }
            
        
            
        }
        
        // 以下為測試 顯示文章
        let request = NSFetchRequest(entityName: "BookmarkEntities")
        
        do {
            
            let results = try self.core_data.executeFetchRequest(request) as! [BookmarkEntities]
            print("------------------")
            for result in results {
                
                print("ID：\(result.id) 標題: \(result.title)")
                
            }
        }catch{
            fatalError("Failed to fetch data: \(error)")
        }
    
        
        
    }

    
    
    
    
    // 產生QR Code
    func GenerateQRCode(imgview: UIImageView) -> UIImage
    {
        
        if self.articleIdforQRCode == "" {
            return UIImage()
        }
        
        let data = self.articleIdforQRCode!.dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
        // data 為要送去製造 QR Code 的 String
        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter!.setValue(data, forKey: "inputMessage")
        filter!.setValue("Q", forKey: "inputCorrectionLevel")
        
        self.qrcodeImage = filter!.outputImage
        
        let scaleX = imgview.frame.size.width / self.qrcodeImage.extent.size.width
        let scaleY = imgview.frame.size.height / self.qrcodeImage.extent.size.height
        // 上面這兩行 是算出目前 imgQRCode 這個 frame 的大小與 qrcodeimage
        
        let transformedImage = self.qrcodeImage.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
        // 轉換 qrcodeimage的大小
        
        return UIImage(CIImage: transformedImage)
        
    }
    
    
    // 按下背景可以返回
    func alertControllerBackgroundTapped()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.navigationItem.title = currentDivisionString
        // 顯示標題在此
        
        self.showarticleFullHTML(21)
        // 一開此頁面顯示文章，以 21 font-size顯示
        
        self.addToHistory()
        
        
    }

    
    func addToHistory()
    {
        
        if let history = NSEntityDescription.insertNewObjectForEntityForName("HistoryEntities", inManagedObjectContext: self.core_data) as? HistoryEntities {
            history.id = currentIdString
            history.time = currentTimeString
            history.author = currentAuthorString
            history.body = currentBodyString
            history.title = currentTitleString
            history.photo = currentPhotoString
            history.division = currentDivisionString
            
            do {
                
                try self.core_data.save()
                // 儲存
                
            }catch{
                
                fatalError("Failure to save context: \(error)")
                // 無法儲存
            }
            
            
            
        }
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
