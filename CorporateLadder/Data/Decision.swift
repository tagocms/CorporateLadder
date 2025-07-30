//
//  Decision.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import Foundation

class Decision: Identifiable {
    enum Month: String, CaseIterable, Equatable {
        case prologue = "Prologue"
        case january = "January"
        case february = "February"
        case march = "March"
        case april = "April"
        case may = "May"
        case june = "June"
        case july = "July"
        case august = "August"
        case september = "September"
        case october = "October"
        case november = "November"
        case december = "December"
        
        func next() -> Month {
            let all = Self.allCases
            let idx = all.firstIndex(of: self)!
            let next = all.index(after: idx)
            return all[next == all.endIndex ? idx : next]
        }
    }
    var id: UUID
    var title: Month
    var subtitle: String
    // Empty array of choices
    var choices: [Choice]
    
    init(id: UUID = UUID(), title: Month, subtitle: String, choices: [Choice]) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.choices = choices
    }
    
    static func createPrologue() -> Decision {
        return Decision(title: .prologue, subtitle: "At the end of the year, you have a performance review with your boss. He tells you that you did okay this year, but if you wanted to get a promotion by the end of the next year, you would need to set a goal and work towards it. What is your goal?", choices: [
            Choice(title: "Promotion to Expert", subtitle: "You desire to be an expert in your field.", stressValue: 0, successValue: 0, goalChoice: .expert),
            Choice(title: "Promotion to Manager", subtitle: "You desire to become a manager.", stressValue: 0, successValue: 0, goalChoice: .manager),
        ])
    }
    static func createDecisions() -> [Decision] {
        return [
            Decision(title: .january, subtitle: "The year starts at a slow pace... a lot of your coworkers are on vacation and there isn't much work to be done. So, you have a bright idea: how about pitching and developing a new project to your boss?", choices: [
                Choice(title: "Pitch and develop project", subtitle: "You show initiative and your boss likes it, he even sponsors the project and puts it in a high priority list. You end up having to work overtime a few days, because you are also responsible for covering for your colleagues vacations.", stressValue: 10, successValue: 20),
                Choice(title: "Keep working as usual", subtitle: "You enjoy your time covering for your colleague's vacations and do a great job doing so. Your boss congratulates you and tells you you are on the right path.", stressValue: 0, successValue: 5)
            ]),
            Decision(title: .february, subtitle: "February breathes life into the office, as people are starting to come back from vacation. Everyone's excited to share what they did during the holidays, and you don't mind hearing about their exploits...", choices: [
                Choice(title: "Give in to the office talk", subtitle: "You love to hear other people talking about themselves, and you also like to talk about yourself a great deal!! Reaching the end of the month, you realize you procrastinated your work and could have done a lot more.", stressValue: -10, successValue: -5),
                Choice(title: "Don't listen to the chatter and focus on your work", subtitle: "It's almost impossible, but you manage to ignore the sounds of people talking, laughing and screaming, almost like it was during high school when your vacation ended. You did all the work you had to.", stressValue: 10, successValue: 10)
            ]),
            Decision(title: .march, subtitle: "March comes and your job starts intensifying a bit more, primarily because the company's CEO came back from a retreat in Singapure and had these amazing new ideas for new products that may or may not sell as well as he hopes. How do you handle this increase in workload?", choices: [
                Choice(title: "Focus on finishing the project you pitched in January", subtitle: "You talk to your manager and are able to delegate your other tasks to your colleagues. You manage to finish and present your project to a room full of executives.", stressValue: 10, successValue: 20),
                Choice(title: "Try to balance your regular workload with the development of the new products", subtitle: "You try to balance your workload and are able to deliver everything necessary, but feel extremely overwhelmed and tired. At least, you know you did a great job. Even so, hopefully, next month will be better...", stressValue: 20, successValue: 30),
                Choice(title: "Renegotiate other deadlines and focus on the development of the new products", subtitle: "You are able to renegotiate your deadlines and work consistently on the new products. Your boss is pleased!", stressValue: 10, successValue: 20)
            ])
        ]
    }
}
