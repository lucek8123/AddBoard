# AddBoard

I made this SwiftUI package for the best work with [ChartView](https://github.com/AppPear/ChartView). 

## Instalation 
### Using Swift package manager

In your project go to File -> Add Packages -> Paste `https://github.com/lucek8123/AddBoard` in the search bar -> Select up to next major version -> Copy Dependency.  

## Usage

First you have to import my package 
``` swift 
import AddBoard
``` 

Second make the Add Board in your View
``` swift 
struct ContentView: View {
    var body: some View {
        VStack {
            ...
            AddBoard(style: AddBoardStyle(), 
                     dropShadow: true, 
                     title: "Test", 
                     legend: "This is Legend", 
                     formSize: AddBoardForm.extraLarge) { 
                print("Clicked!") 
            }
            ...
        }
    }
}
``` 

Third - Enjoy AddBoard!
