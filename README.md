<img width="444" alt="screen shot 2016-04-30 at 17 52 16" src="https://cloud.githubusercontent.com/assets/3276768/14935221/65cda908-0efc-11e6-993c-6bca57faeb62.png">

As is common in every app development cycle, there comes a time when we must start setting up a project. And this is pretty much always the same steps. Setting up folders, architecture, Podfile, etc.

This is a base project in **Swift**, for **iOS** application. This base project is based on the **MVVM** architeture. It's totally automated thanks to a script, for fast production.

#Installation

To install this base project, for your new app, just run the script *install.sh*. This will rename the base project with your app name, and install pods. After that, you will be ready to go.

```sh
./install.sh YOUR_APP_NAME
```

![tty](https://cloud.githubusercontent.com/assets/3276768/14935252/5b072566-0efd-11e6-9842-28ae8d7ace0e.gif)

#Architecture

####MVVM

The structure of the base project is based on the **MVVM** (*Model-View-ViewModel*) architecture.

![ic564167](https://cloud.githubusercontent.com/assets/3276768/14935286/4cc0b0f2-0efe-11e6-93b0-1e639a3d659a.png)


There are three core components in the MVVM pattern: the model, the view, and the view model. Each serves a distinct and separate role. The following illustration shows the relationships between the three components.
In the **iOS development** the UIViewController has the UIView, and the controller. Each **UIViewController** has its one **ViewModel**.

That means the **UIViewController** manage only the view (binding data to the *UIView*). And the **ViewModel** handle the data with the model (*perform request, formating data before binding, etc*).

So **UIViewController** doesn't know anything about the model, and the data, its role is to bind the data in **UIView** from the **ViewModel**. Then **ViewModel** doesn't know anything about the **UIView** (interaction, etc).

To handle the communication between the **UIViewController** and the **ViewModel**, I use **RxSwift**, to observe the data, and bind it with the **UIView** (*Any Reactive programing framework can be use here. You can event use some delegate pattern*).

####AppCoordinator

The idea being that is to remove the **UIViewController** initalisation outside the application context.

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
    var viewmodel: ViewModel?
 
    func didLoginUser() {
      ...
  
      self.transitions?.didLogin()
    }
 
    ...
}
```

