<img width="444" alt="screen shot 2016-04-30 at 17 52 16" src="https://cloud.githubusercontent.com/assets/3276768/14935221/65cda908-0efc-11e6-993c-6bca57faeb62.png">

项目（使用MVVM结构）基于App极速启动

As is common in every app development cycle, there comes a time when we must start setting up a project. And this is pretty much always the same steps. Setting up folders, architecture, Podfile, etc.

This is a base project in **Swift**, for **iOS** application. This base project is based on the **MVVM** architeture. It's totally automated thanks to a script, for fast production.

#Installation

To install this base project, for your new app, just run the script *install.sh*. This will rename the base project with your app name, and install pods. After that, you will be ready to go.

```sh
git clone https://github.com/remirobert/MVVMBaseProject.git
cd MVVMBaseProject
./install.sh YOUR_APP_NAME
```

![tty](https://cloud.githubusercontent.com/assets/3276768/14935252/5b072566-0efd-11e6-9842-28ae8d7ace0e.gif)

#Architecture

####📱 production / 🛠 development

The project has two different targets, **prod** and **dev**. And with the marco **DEV**, you can configure some global variables like the *URL of your server*, etc. Also two different LaunchScreens are provided to avoid confusion when you are developing your app.

This is how you can setup some variables depending on your developement environement. You can switch easily between two modes with the schemes.
```Swift
#if DEV
let SERVER_URL = "http://dev.server.com/api/"
#else
let SERVER_URL = "http://prod.server.com/api/"
#endif
```

####MVVM

The structure of the base project is based on the **MVVM** (*Model-View-ViewModel*) architecture.

![ic564167](https://cloud.githubusercontent.com/assets/3276768/14935286/4cc0b0f2-0efe-11e6-93b0-1e639a3d659a.png)


There are three core components in the MVVM pattern: the model, the view, and the view model. Each serves a distinct and separate role. The following illustration shows the relationships between the three components.
So, in the **iOS development** the UIViewController has the UIView, and the controller. Each **UIViewController** has its one **ViewModel**.

To handle the communication between the **UIViewController** and the **ViewModel**, I use **RxSwift**, to observe the data, and bind it with the **UIView** (*Any Reactive programing framework can be use here. You can event use some delegate pattern*).

This design pattern will avoid you the **MEGA UIViewController** (thanks god 🙏).

####AppCoordinator

The idea being that is to move the **UIViewController** initalisation outside the application context by :

 - manage the transitions between **UIViewController**, and the way to present them (*present, push, show, etc*)
 - initialise the **ViewModel** for each **UIViewController**
 - handle the data flow between **UIViewController**

At this point each **UIViewController**, are less or more very generic, and can be reused in an another application very easily.

example for a *LoginViewController*:

*AppCoordinator.swift*:
```swift
private func instanceLoginController() {
  guard let vc = LoginViewController.instanceController(StoryBoards.Login) as? LoginViewController else {
     return
  }
  
  vc.transitions = LoginTransitions(
     didLogin: {
       self.instanceFeedController()
  })
  
  //init ViewModel, can passe some data from other controllers
  vc.viewModel = LoginViewModel()
  self.rootController = UINavigationController(rootViewController: vc)
  vc.start()
}
```

*LoginViewController.swift*:
```swift
struct LoginTransitions {
    var didLogin: (Void -> Void)
}

class LoginViewController: UIViewController, Coordinable {

    var transitions: LoginTransitions?
 
    typealias ViewModel = LoginViewModel
    var viewModel: ViewModel?
 
    func didLoginUser() {
      ...
  
      self.transitions?.didLogin()
    }
 
    ...
}
```

made in 同济 with ❤️


If you have any suggestion to improve this architecture, or some reckon, please be free to tell me. All the **pull request** are welcome And also don't forget to ⭐️ if you like it 😉.

![ezgif-1103114166](https://cloud.githubusercontent.com/assets/3276768/14935398/e087e6ee-0f02-11e6-9469-16ac856aa2ff.gif)


## License

`MVVMBaseProject` is released under an [MIT License][mitLink]. See `LICENSE` for details.

>**Copyright &copy; 2016 Rémi ROBERT.**

*Please provide attribution, it is greatly appreciated.*

[mitLink]:http://opensource.org/licenses/MIT
