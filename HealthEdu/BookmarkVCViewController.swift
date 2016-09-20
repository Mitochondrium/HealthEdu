//
//  BookmarkVCViewController.swift
//  HealthEdu
//
//  Created by Mac on 2016/9/17.
//  Copyright © 2016年 NCKU_hospital. All rights reserved.
//

import UIKit

class BookmarkVCViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var BookmarkSegControlIBO: UISegmentedControl!
    var articleArrayHistory:[article] = [article]()
    var articleArrayBookmark:[article] = [article]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 建立articleArrayHistory
        let articleHistory1 = article(id: "7", title: "認識家庭醫師", photoUIImage: UIImage() ,  photo: "Diagnosis.jpg", author: "成大醫院", body: "<p>你是否也曾有過掛錯號、找錯科醫師的經驗？假如你有位熟悉自己健康背景的醫師，就能得到最方便、省時、省錢又親切的服務。家庭醫師就在擔負有這項功能，協助照顧全家人的健康。</p><p>成大醫院家庭醫學部楊倫欣醫師表示，家庭醫師強調的是「全人」照顧，以人為本，不分男女老少，透過瞭解家庭成員的健康狀況，給予全家持續性的醫療照顧，並幫助有效利用醫療資源，改善身體、心理、社會等方面的生活品質，成為家庭成員的健康守護者。</p><p>楊倫欣醫師指出，家庭醫師的特色，是提供家庭成員持續性的、完整性的、協調性的、可近性的及負責性的照顧。</p><p>因此，最適合找家庭醫師的情況是：</p><p>1.常見的慢性疾病、心理疾病的診治與全家人健康的整體照顧；</p><p>2.各項疾病預防的相關健康諮詢；</p><p>3.提供全民健保成人預防保健服務或其他各類的中英文健康檢查；</p><p>4.疫苗接種及其他預防性的健康照顧；</p><p>5.依病人需要，轉診至其他專科醫師或轉介其他社會相關資源。</p>", time: "2009-01-01", division: "最新消息")
        
        let articleHistory2 = article(id: "119", title: "超越種族薪傳生命捐贈者家屬現身談器捐理念", photoUIImage: UIImage() ,  photo:  "organ.jpg", author: "成大醫院", body: "<p>「對於漢思的大愛，我很感激。我的老婆終於可以不用以醫院為家了。」劉太太洗腎洗了八年，一個星期得到醫院報到三次，現在終於等到腎臟，劉太太的老公，代表他的老婆，向捐贈者家屬道謝。</p><p>簽下器官捐贈同意書的那一刻，漢思(Hans)的太太珊卓(Sandra)，心很痛，不過她知道，這個決定可以把對先生的思念，化成另一種愛，這種愛跨越國際，讓更多人重生。</p><p>來自加拿大的體育老師漢思，五年前和老婆來台灣一年，深深愛上台南的濃厚人情味。去年珊卓受聘到南科國際實驗高級中學教英文，漢思也跟著老婆來台灣，伴妻兼度假。</p><p>漢思還是一位專業的單車騎士，沒事的時候，最喜歡騎著車探索台灣。2010年5月7日早上，漢思再度騎車上路，沒想到卻發生意外，路人發現他倒臥在大水溝旁，緊急將其送至台南新樓醫院。當天深夜，漢思意識改變，經電腦斷層檢查診斷頸椎脫位合併椎動脈損傷。醫師向珊卓解釋病情，告知她的先生有可能走向瀕臨腦死時，珊卓即主動向醫師表明器官捐贈意願。</p><p>5月8號早上10點，新樓醫院王瀞茹專科護理師，通報成大醫院移植小組，溝通漢思的狀況，並與家屬說明器捐流程與轉院的必要性，珊卓表態完全配合捐贈相關流程。5月11日，漢思兩位兒子分別由加拿大和南美洲飛抵成大醫院，見父親最後一面。5月12日由友人陪同辦理報案並完成筆錄，於當天下午3點40分及8點55分通過兩次腦死判定，台南地檢署於晚間9點40分協助完成簡易法庭司法相驗程序。</p><p>5月13日上午九點，成大醫院移植小組替漢斯進行捐贈移植手術，手術約十小時，漢斯成功捐贈心臟一枚至台北三軍總醫院給61歲王姓病人、肝臟一枚給成大57歲王姓病人、腎臟兩枚給成大41歲黃姓與45歲劉姓病人、眼角膜、鞏膜給57歲楊姓與76歲蔡姓病人，共六人因此獲得全新的生命，皮膚及骨骼則冰凍保存給未來須要的患者。</p><p>成大醫院積極推動器官捐贈觀念，醫院一樓大廳還特設「大愛紀念區」，將每位器官捐贈者的名字、再生日、捐贈器官刻在純金牌上，表彰其大愛。其中一面壁文，並記載了1996年發生在成醫、一位美籍少女伊莉莎白腦死，其醫師慈父主動捐出腎臟幫洗腎患者重生的故事，此感人的「大愛精神不死」故事，還編入翰林出版社國小六年級上學期的教科書裡面，成為社會的模範，每年有10萬位同學因此瞭解器官捐贈與移植的意義與價值。</p><p>不接受鮮花，珊卓要大家把這筆錢捐給需要的人。先生的追思會，也一切從簡，選擇海葬。面對摯愛的死亡，珊卓用實際的行動，解釋了「把小愛化大愛」的意義。</p>", time: "2010-06-01", division: "最新消息")
        
        let articleHistory3 = article(id: "626",title: "氣喘治療新知--全方位療法", photoUIImage: UIImage() ,  photo: "Surgery.jpg", author: "胸腔內科李政宏醫師", body: "<p>氣喘治療新知--全方位療法</p><p>又到秋高氣爽的季節，不少氣喘病患也開始進到好發時段，當你每晚有咳嗽、呼吸困難、胸悶或哮鳴聲時，就要注意是否氣喘發作了。很多病人常常忽略氣喘病的初期症狀，或把咳嗽當一般感冒治療許久，沒想到是氣喘病，因而拖延治療最佳時機。</p><p>氣喘治療首重保養預防，及發作後的藥物治療。保養預防主要分兩個部分：</p><ol><li>有氣喘和異位性體質家族史者，應避面特定過敏原的接觸，例如：塵螨、二手菸、狗、貓、蟑螂…等。</li><li>工作場所過敏原的排除及防護，例如：空調過濾化學過敏原。</li></ol><p>至於氣喘的藥物治療，雖然截至目前為止仍未有能「根治」的藥物，但是卻有許多有效且安全的藥物可以預防氣喘發作，或治療氣喘時的症狀。這包括：控制發炎的藥物，是支氣管發炎的治本藥物，其他還有症狀緩解的藥物、控制發炎與緩解二者合併的吸入性藥物、抗免疫球蛋白E抗體。</p><p>值得注意的是，氣喘在惡化時毫無警訊，所以有時會發生因氣喘發作而致死的病例。為了監控病情的方便，患者必須學會使用尖峰呼氣流速器，隨時檢視自己的氣喘處於何種發炎程度，透過尖峰呼氣流速器的綠、黃、紅燈區域來標示氣喘的嚴重度，及早發覺疾病的惡化。</p><p>尖峰呼氣流速器綠燈區表示情況穩定，當處於此時期達3個月以上，要考慮減少使用藥量。黃燈區則表示要小心，此時若正常作息受影響，無法運動，夜間有發作症狀，應告知醫師調整藥物，以利氣喘控制，直到呼氣流速回到綠燈區。</p><p>如果在紅燈區是醫療警訊，表示須就醫治療，且氣喘已經妨礙正常作息及工作，當使用吸入短效支氣管擴張15~20分鐘後再測尖峰呼氣流速，仍低於60%，則應立即就醫。</p><p>總之，氣喘病是一個常見的慢性呼吸道發炎疾病，嚴重時可能導致呼吸困難且有致命的危險，唯有早期診斷且藉藥物治療控制，並利用尖峰呼氣流速監測，達到病情控制，才能有效避免因急性發作而需住院的情形。</p>",time: "2008-12-01", division: "胸腔內科")
        
        
        
        articleArrayHistory.append(articleHistory1)
        articleArrayHistory.append(articleHistory2)
        articleArrayHistory.append(articleHistory3)
        
        // 建立 articleArrayBookmark
        let articleBookmark1 = article(id: "251",title: "紅疹高燒恙蟲病、感冒傻傻分不清楚",photoUIImage: UIImage() ,  photo: "bug.jpg", author: "感染科李佳雯醫師", body: "<p>71歲平時相當健康的老先生，斷續發燒兩個星期，合併皮疹、全身無力、食慾不佳、及髖關節疼痛，到院時意識清楚、生命徵象穩定，除以上症狀外，在臀部亦發現一痂皮病灶，抽血檢查白血球上升、肝指數異常、發炎指數升高；37歲無不良習慣之青年人，斷續發燒一週，合併皮疹及關節痠痛，到院時休克、意識不清、呼吸衰竭，抽血檢查白血球上升、嚴重肝炎併黃疸、發炎指數升高、急性腎衰竭。上面兩種極端不同的臨床表現，經成大醫院斗六分院感染科李佳雯醫師診斷後，皆為感染恙蟲病。</p><p>成大斗六分院感染科李佳雯醫師表示，恙蟲病之病原為恙蟲立克次體(Orientiatsutusgamushi)，為一細胞內寄生病原體，存在於自然界之齧齒動物類動物體內，例如老鼠，經由恙蟎叮咬帶菌之齧齒類，再叮咬宿主而使宿主感染疾病。因此恙蟲病是不會經過人與人之間傳染，民眾無須驚慌。恙蟎生長須高濕環境，蟲體肉眼幾乎看不見，幼蟲爬行於土面，或喜停留於雜草之尖端，伺機叮咬經過之動物或人類身上。被感染後潛伏期平均為一到兩星期，病人主要表現發燒、皮疹、焦痂、淋巴結腫大、頭痛、肌肉痠痛、關節痠痛等無特異性之臨床症狀，但若經抽血檢驗常可見白血球數目異常、及肝功能異常。感染發病後，可併發腦炎、肺炎、心肌炎、及肝腎功能異常等併發症，若無適當之治療，死亡率可達百分之六十，但若即時接受治療，死亡率即小於百分之五。由於恙蟲病未經治療的死亡率偏高，因此李醫師呼籲民眾不可掉以輕心。</p><p>李佳雯醫師談到由於被恙蟲病感染後臨床症狀較無特異性，醫師若無較高的警覺性，往往會以為病患的症狀是感冒，導致病患延誤治療而病情加重。治療恙蟲病主要仰賴四環黴素或氯黴素為主要治療之抗生素種類，病患只要依照醫師指示用藥多可恢復。恙蟲病歸屬於第四類法定傳染病，因此，對於懷疑個案須以疑似病例通報轄區衛生局，抽血送至疾病管制局合約實驗室透過聚合酶連鎖反應作病原體檢測或間接螢光抗體法測其抗體以確定診斷，必要時亦會做二次採血檢驗。李醫師也提及因為恙蟲之生活特性的關係，易感染族群多為可行動自如之青壯年，台灣地區主要病例集中在花蓮縣、台東縣、南投縣、及離島地區。因此民眾就醫時，可主動告知醫師自身旅遊史及接觸史，以利醫師診斷。</p><p>最後成大斗六分院李佳雯醫師提醒民眾預防恙蟲病，在野外工作或旅遊時，盡可能不要進入草叢區或著長袖衣褲及靴子，必要時亦應在身體暴露處塗抹驅蟲藥劑以防止恙蟎叮咬，並於回家後立即沐浴更換衣物。另外，居家環境則須注意改善潮濕、剷除雜草及消滅老鼠，以杜絕恙蟎之孳生。最重要的是，若有身體不適，宜盡速前往專業合格之醫療院所如本院就醫診療，在合宜的治療下，多可獲得良好的預後。</p>", time: "2012-01-01", division: "感染科")
        
        let articleBookmark2 = article(id: "49",title: "常見的肩關節運動傷害",photoUIImage: UIImage() ,  photo: "bone.jpg", author: "骨科部蘇維仁醫師", body: "<p>常見的肩關節運動傷害，可分為兩種機轉：跌倒、激烈碰撞等外傷，及投擲、發球等重複動作傷害。</p><p>外傷最常造成肩關節脫臼，肩關節脫臼則常會造成肩盂唇軟骨的撕裂傷。肩盂唇是肩關節內維持穩定的重要構造，常會因外力而從肩盂的邊緣撕裂，並且和骨頭剝離。年輕人的肩盂唇撕裂大部分不會自行癒合，假使受傷的肩盂唇沒有完全癒合，肩盂唇就會形成一個缺口，無法維持肩關節的穩定度，進而導致日後所謂的習慣性脫臼。</p><p>90%以上的肩關節脫臼，都是由前方脫出，肩盂唇剝離的位置也常位於肩盂的前下方，所以，再脫臼都發生在上臂外展及外轉的動作。如反覆脫臼，前方的關節囊也會變成愈來愈鬆弛，使得脫臼越容易發生。</p><p>多數人對肩關節重複脫臼不以為意，認為只要多加注意某些可能的危險姿勢，或避免某些運動，就可以減少脫臼發生的機會。其實，每脫臼一次，肩關節就受傷一次，長期的肩關節不穩定，累積了多次的脫臼或半脫臼，都會造成關節軟骨的磨損，使關節提早老化。</p><p>另外，年紀較大的人發生脫臼時，除了上述的受傷外，旋轉肌腱也常常一起破裂，由於旋轉肌腱破裂後也不容易癒合，因此造成日後的疼痛及無力。</p><p>重複動作傷害，是因為長期重複激烈的使用肩關節，特別是投擲運動，最容易對肩關節造成傷害。投擲動作的外旋和外展，會造成肩盂唇和關節側的旋轉肌腱發生碰撞，如果加上前關節囊韌帶太鬆、後關節囊韌帶太緊，肩關節因為累積過度的碰撞，容易造成關節囊鬆弛，肩盂唇或旋轉肌腱的撕裂傷，結果導致肩關節活動時發生不穩定現象而疼痛。</p><p>當肩關節受傷後，骨科醫師可根據臨床問診及理學檢查，初步判斷病人的受傷組織為何；另外可利用X光、超音波或核磁共振等設備輔助，確定受傷部位。</p><p>復健物理治療在受傷復原期扮演很重要的角色，在專業的物理治療師指導下進行循序漸進的復健，可讓受傷的肩關節逐漸恢復活動。然而，有時受傷而造成撕裂的肩關節組織不易自行癒合，所以，這些結構上有缺陷的關節，將無法完全恢復受傷前的活動力。當病人想做某些特定動作，如舉手過肩或是投擲時，會因為疼痛而無法完成這個動作。接受手術是修補這些受損組織的唯一方法。</p><p>近年來，關節鏡手術發展迅速，擁有傷口小、疼痛少、復原迅速的優點。撕裂的肩盂唇、關節囊或旋轉肌腱，均可利用關節鏡手術加以修補。傳統肩關節手術須犧牲正常的組織，微創的肩關節鏡手術只需在肩膀上開3個1公分的小洞，減少對正常組織的破壞，接著放入直徑約0.5公分的器械，從關節內部先做徹底的檢查，再將受傷的部位做完整的修復。</p><p>病人接受肩關節鏡手術後隔天即可出院，提早接受復健治療，讓受傷的肩關節慢慢恢復它完整的結構，回復受傷之前的功能。</p>", time: "2009-06-01", division: "骨科")
        
        let articleBookmark3 = article(id: "22",title: "我如何施行這手術HowIDoTheOperation",photoUIImage: UIImage() ,  photo: "operation.jpg", author: "一般外科主任李伯璋教授", body: "<p>我如何施行這手術　成大外科無私出版「武功祕笈」</p><p>如果你接受過開刀治療，你知道外科醫師是怎麼幫你做手術的嗎？</p><p>成大醫學院外科學科集合了一般外科、移植外科及小兒外科醫師之力，出版了「我如何施行這手術HowIDoTheOperation」，以無私的精神，打開手術過程的黑盒子。</p><p>「我如何施行這手術」書中詳細介紹了60個臨床手術的心法，並儘可能以中文敘述，讓醫學生也能夠很快領略手術過程的進行；而對於年輕外科醫師來說，這是一本凝聚資深外科醫師智慧與心血結晶的「術式經典」，有如古代大俠武功祕訣心經的口述，是增進功力的祕笈。</p><p>書中內容涵蓋：乳房、移植、內分泌、胰肝膽及胃、大腸直腸肛門、創傷、疝氣、導管植入、小兒外科等9個章節、60個臨床術式。</p><p>規畫、編纂這本「武功祕笈」的成大醫院一般外科主任李伯璋教授表示，在臨床教學中，很多醫學生看開刀，未必知道重點在哪裡，有這本書做參考，學習應該可以事半功倍；對於住院醫師在手術台上擔任助手時，更可以因此與老師有默契，相信手術品質也能相對提高，給病人最好的醫療照顧。</p><p>誠如護理部黃美智主任指出，希望此書能帶給手術室護理人員，在手術過程與主治醫師有共同的想法，則更能提升術前器械備物的完整性，與手術中與主治醫師的默契。</p><p>前任一般外科主任的林炳文副院長表示，即使是同一手術術式，執行過程中，每位外科醫師可能有不同技巧，也可能有不同或獨到的心得，這些獨特的「招式」、「祕訣」或「訣竅」，都是每一位外科醫師經過多年的修煉，才慢慢領略或發展出來的。透過這本「祕笈」，外科醫師可以相互觀摩，也能讓住院醫師掌握到手術的訣竅。</p><p>成大醫院外科部主任李政昌教授也指出，這本書提供各級實習醫學生及住院醫師，在學習各種手術及跟刀或開刀前瀏覽內容，可以迅速掌握師長開刀的重點，讓學習事半功倍，也更能幫助自己成長。</p><p>台灣外科醫學會理事長李伯皇教授表示，這本書在國內屬新的嘗試，對國內年輕醫師的養成具有很大的助益。</p><p>李伯璋教授以為，純熟的技術是外科醫師追求的理想與目標，生命的火焰要往上燃燒，上面就需要空間，同樣的，能薪火相傳給學生，以造福人群，是成大外科師長們最大的成就與理想。</p>", time: "2009-03-01", division: "一般外科")
        
        articleArrayBookmark.append(articleBookmark1)
        articleArrayBookmark.append(articleBookmark2)
        articleArrayBookmark.append(articleBookmark3)




        // Do any additional setup after loading the view.
    }
    
    // 不同Segm換鈕切換時的結果
    

    @IBAction func BookmarkSegControlAction(sender: AnyObject) {
        tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    // 不同array被選擇時，要回傳不同row的數量
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnRowCount = 0
        switch (BookmarkSegControlIBO.selectedSegmentIndex) {
        case 0:
            returnRowCount = articleArrayHistory.count
        case 1:
            returnRowCount = articleArrayBookmark.count
        default:
            break
        }
        
        
        return returnRowCount
    }
    
    // 不同的seg要傳回不同的cell值
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! myBookmarkCell
        
        switch (BookmarkSegControlIBO.selectedSegmentIndex) {
        case 0:
            let articleItem = articleArrayHistory[indexPath.row]
            cell.BookmarkImageViewCellIBO.image = UIImage(named: articleItem.photo)
            cell.BookmarkTitleIBO.text = articleItem.title
            cell.BookmarkAuthorIBO.text = articleItem.author
            cell.BookmarkBodyIBO.text = articleItem.body
            break
        case 1:
            let articleItem = articleArrayBookmark[indexPath.row]
            cell.BookmarkImageViewCellIBO.image = UIImage(named: articleItem.photo)
            cell.BookmarkTitleIBO.text = articleItem.title
            cell.BookmarkAuthorIBO.text = articleItem.author
            cell.BookmarkBodyIBO.text = articleItem.body
        default:
            break
        }
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let articleDetail = segue.destinationViewController as! ArticleViewController
        if let indexPath = self.tableView.indexPathForSelectedRow {
            // 因為有兩種情況，所弄了酪switch 我覺得這堆碼有夠醜Q
            switch (BookmarkSegControlIBO.selectedSegmentIndex) {
            case 0:
                let articleSelected = articleArrayHistory[indexPath.row]
                articleDetail.currentTitleString = articleSelected.title
                articleDetail.currentBodyString = articleSelected.body
                articleDetail.currentAuthorString = articleSelected.author
                articleDetail.currentDivisionString = articleSelected.division
                articleDetail.currentPhotoString = articleSelected.photo
                articleDetail.currentTimeString = articleSelected.time
                break
            case 1:
                let articleSelected = articleArrayBookmark[indexPath.row]
                articleDetail.currentTitleString = articleSelected.title
                articleDetail.currentBodyString = articleSelected.body
                articleDetail.currentAuthorString = articleSelected.author
                articleDetail.currentDivisionString = articleSelected.division
                articleDetail.currentPhotoString = articleSelected.photo
                articleDetail.currentTimeString = articleSelected.time
            default:
                break
            }
    
            
            
            
            // 這個func的作用:先把 articleArray中，被選中的資料，指定為 articleSelected這個變數(class是article )，然後將來自"ArticleViewController"的變數指定為articleDetail這個var(class 是ArticleViewController)，接著把articleSelected的每個變數都指定為articleDetail的各個對應的變數，類型都是String
            
            
        }
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