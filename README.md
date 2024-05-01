# Resume App

<p align="center">
  <img src="https://github.com/Themakew/resume-app/assets/3030029/387a2f0d-648f-46ad-a1b9-bd129dfef565" alt="Simulator Screenshot - iPhone 15 Pro Max - 2023-10-10 at 17 54 42" width="200"/>
  <img src="https://github.com/Themakew/resume-app/assets/3030029/e2aee9ee-9c4b-4724-bb13-025b6de66200" alt="Simulator Screenshot - iPhone 15 Pro Max - 2023-10-10 at 17 54 33" width="200"/>
  <img src="https://github.com/Themakew/resume-app/assets/3030029/3a47ae7d-1114-4ab2-ae31-9d5c2cfe03db" alt="Simulator Screenshot - iPhone 15 Pro Max - 2023-10-10 at 17 54 42" width="200"/>
  <img src="https://github.com/Themakew/resume-app/assets/3030029/66a324cd-3144-406b-bd15-e8b552612257" alt="Simulator Screenshot - iPhone 15 Pro Max - 2023-10-10 at 17 54 33" width="200"/>
  <img src="https://github.com/Themakew/resume-app/assets/3030029/c880cf28-bbc0-4634-9b81-8c3169c31437" alt="Simulator Screenshot - iPhone 15 Pro Max - 2023-10-10 at 17 54 42" width="200"/>
  <img src="https://github.com/Themakew/resume-app/assets/3030029/ff0808ea-4a92-4de1-8b03-38180cae6c60" alt="Simulator Screenshot - iPhone 15 Pro Max - 2023-10-10 at 17 54 33" width="200"/>
</p>

Resume is a simple app to work as a showcase of my work, using tools such as: Swift, SwiftUI and MVVM.

This app is almost exactly replica of Caio Resume App: <a href="https://github.com/caiiocasttro/CAIOSDEV-APP">Repo</a></p>), the main ideia here was to rebuild the app using 100% SwiftUI.

## Functionalities
✔️ Show skill details on each tab using a sheet view (<a href="https://www.youtube.com/watch?v=8Ys83qvnDvE&t=754s">link</a></p> to the video that I used as base).

## Technologies and tools used

- Swift: program language
- SwiftUI: declarative way to build screens layout

## Architecture used

Architecture used was MVVM, with some elements of Clean Architecture. Strong reference used: <a href="https://github.com/kudoleh/iOS-Clean-Architecture-MVVM">repo.</a></p> 

## Challenges

It is difficult to get the same or similar effect using the sheet screen from the original Caio's program in SwiftUI. Apple still provides us developers a lot of freedom to totally design every part of this screen, so I came across a really interesting suggestion from Kavsoft where he put a window in front of the existing window (used for the application) to put the tab view, especially the sheet view, in front. SwiftUI currently does not allow for such customization.

Another essential element to note is that when you call the sheet view in SwiftUI, it has a dimming view by default. The only option to make it smaller was to use the .medium detent (which was not required). As a result, the dimming view shrank, allowing you to click in the background view and have full access to screen objects.

## How to run the project?

It is quite straightforward:

Run xcode project file from the root directory of this repository.

---
<p align="center">Made by Ruyther Costa | Find me on <a href="https://www.linkedin.com/in/ruyther">LinkedIn</a></p>
