/*
 Dependency Inspection
 -https://github.com/Swinject/Swinject incele yapğabilirsiniz. https://github.com/Swinject/Swinject.git adresinden spm ile kütüphaneyi çektik. Sadece swinject yeterlidir diğerini silebiliriz (swinject-Dynamic)
 -Dependency demek projemizin bağımlı olduğu yapılar demektir
 -arka plan renglerini saklayan protokol ve protokolu uygulayan bir sınıf yazıcaz ve bu controller içinde yazıcaz aslında 2.viewcontrollere bu tanımlanmalar enjekte edilmiş olucak
 */

import UIKit
import Swinject

class ViewController: UIViewController {
    
    //Swinject // protokolun tanımlanması...
    //bu tanımlamayı DependenyInject klasör açıp yapanlarda olur daha profesyonel
    let container : Container = {
       let container = Container()
        //kayıt edicez bu durumda böyle davransın diye
        container.register(BackgroundProvidingClass.self) { resolver in
            //resolver çözümleyici bu örnekte ihtiyaöta olmucakta
            return BackgroundProvidingClass()
        }
        
        //eğer AnotherVC kullanıp bu protokolle çözümlnecek diyebiliriz
        container.register(AnotherVC.self) { resolver in
            let vc = AnotherVC(providerProtocol: resolver.resolve(BackgroundProvidingClass.self))
            return vc
        }
        return container
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //arka plan rengini mavi yapıcak
        view.backgroundColor = .systemBlue
        
        //buton eklendi...
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.setTitle("Open Another VC", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
    }

    
    @objc private func buttonClicked (){
        //AnotherVC tanımlaması ya çözümlerse demek diuyebiliriz
        if let viewController = container.resolve(AnotherVC.self){
            //ekranı açar buda
            present(viewController,animated: true)
        }
    }

}

