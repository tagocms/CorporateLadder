<h1 align="center">
    <img src="./Screenshots/hero.png" alt="Corporate Ladder">
</h1>

<p align="center">
  <i align="center">A corporate simulation game where <b>every choice comes at a cost</b></i>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Swift-5.0-orange?logo=swift" alt="Swift 5.0">
  <img src="https://img.shields.io/badge/SwiftUI-blue?logo=swift" alt="SwiftUI">
  <img src="https://img.shields.io/badge/iOS-17.6%2B-lightgrey?logo=apple" alt="iOS 17.6+">
  <img src="https://img.shields.io/badge/version-1.0-brightgreen" alt="Version 1.0">
  <img src="https://img.shields.io/badge/License-MIT-green" alt="MIT License">
</p>

## Introduction

**Corporate Ladder** is an iPhone simulation game built with SwiftUI that puts you in the shoes of an employee navigating a full year of tough corporate decisions.

Each month presents a real workplace dilemma — pitching side projects, office gossip, mentoring coworkers, or protecting your own mental health. Your choices accumulate **stress** and **success** points, and decisions made early in the year dynamically alter the scenarios that follow, creating a branching tree of consequences.

## Screenshots

<details open>
<summary>Screenshots</summary>
<br />

<p align="center">
    <img width="49%" src="./Screenshots/ss_1.png" alt="Start screen with logo and Climb the Ladder button"/>
&nbsp;
    <img width="49%" src="./Screenshots/ss_2.png" alt="Prologue screen where the player chooses between becoming an Expert or a Manager"/>
</p>
<p align="center">
    <img width="49%" src="./Screenshots/ss_3.png" alt="Monthly decision screen showing a corporate scenario with two choices"/>
&nbsp;
    <img width="49%" src="./Screenshots/ss_4.png" alt="Ending screen showing final score, mental health outcome, and whether the promotion goal was reached"/>
</p>

</details>

## Development

- **Architecture**: MVVM with `@Observable`. `GameViewModel` centralises game state, scoring logic, and runtime mutation of future decisions based on prior choices.
- **Frameworks**: SwiftUI for all UI; `AVFoundation` via `SoundManager` for stamp sound effects; `CoreHaptics` via `HapticsManager` for tactile feedback.
- The technical highlight is the **butterfly effect** system: choices made in January, April, July, and October directly modify the content and options of later months at runtime.

## Resources & Credits

- **Fonts**: [Poppins](https://fonts.google.com/specimen/Poppins) (Medium, SemiBold, Bold) and [Roboto](https://fonts.google.com/specimen/Roboto) (Regular, SemiBold, Bold) — Google Fonts.
- **Sound effects**: Stamp audio samples (`.mp3`) included in the project bundle.

## License

Corporate Ladder is available under the [MIT License](./LICENSE).
