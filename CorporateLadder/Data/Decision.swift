//
//  Decision.swift
//  CorporateLadder
//
//  Created by Tiago Camargo Maciel dos Santos on 30/07/25.
//

import Foundation

class Decision: Identifiable {
    var id: UUID
    var title: Month
    var subtitle: String
    var callToAction: String
    // Empty array of choices
    var choices: [Choice]
    
    init(id: UUID = UUID(), title: Month, subtitle: String, callToAction: String, choices: [Choice]) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.callToAction = callToAction
        self.choices = choices
    }
    
    static func createPrologue() -> Decision {
        return Decision(title: .prologue, subtitle: "At the end of the year, you have a performance review with your boss. \nHe tells you that you did okay this year, but if you wanted to get a promotion by the end of the next year, you would need to set a goal and work towards it.", callToAction: "What is your goal?", choices: [
            Choice(title: "Promotion to Expert", subtitle: "You desire to be an expert in your field.", stressValue: 0, successValue: 0, goalChoice: .expert),
            Choice(title: "Promotion to Manager", subtitle: "You desire to become a manager.", stressValue: 0, successValue: 0, goalChoice: .manager),
        ])
    }
    static func createDecisions() -> [Decision] {
        return [
            Decision(title: .january, subtitle: "The year starts at a slow pace... a lot of your coworkers are on vacation and there isn't much work to be done. \n\nSo, you have a bright idea:", callToAction: "how about pitching and developing a new project to your boss?", choices: [
                Choice(title: "Pitch and develop project", subtitle: "You show initiative and your boss likes it, he even sponsors the project and puts it in a high priority list. You end up having to work overtime a few days, because you are also responsible for covering for your colleagues vacations.", stressValue: 10, successValue: 20, tag: .project),
                Choice(title: "Keep working as usual", subtitle: "You enjoy your time covering for your colleague's vacations and do a great job doing so. Your boss congratulates you and tells you you are on the right path.", stressValue: 0, successValue: 5)
            ]),
            Decision(title: .february, subtitle: "February breathes life into the office, as people are starting to come back from vacation. \n\nEveryone's excited to share what they did during the holidays, and you don't mind hearing about their exploits...", callToAction: "will you talk to them?", choices: [
                Choice(title: "Give in to the office talk", subtitle: "You love to hear other people talking about themselves, and you also like to talk about yourself a great deal!! Reaching the end of the month, you realize you procrastinated your work and could have done a lot more.", stressValue: -10, successValue: -5),
                Choice(title: "Don't listen to the chatter and focus on your work", subtitle: "It's almost impossible, but you manage to ignore the sounds of people talking, laughing and screaming, almost like it was during high school when your vacation ended. You did all the work you had to.", stressValue: 10, successValue: 10)
            ]),
            Decision(title: .march, subtitle: "March comes and your job starts intensifying a bit more, primarily because the company's CEO came back from a retreat in Singapure. \n\nThere, he had these amazing new ideas for new products that may or may not sell as well as he hopes.", callToAction: "How do you handle this increase in workload?", choices: [
                Choice(title: "Try to balance your regular workload with the development of the new products", subtitle: "You try to balance your workload and are able to deliver everything necessary, but feel extremely overwhelmed and tired. At least, you know you did a great job. Even so, hopefully, next month will be better...", stressValue: 15, successValue: 25),
                Choice(title: "Renegotiate other deadlines and focus on the development of the new products", subtitle: "You are able to renegotiate your deadlines and work consistently on the new products. Your boss is pleased!", stressValue: 10, successValue: 20)
            ]),
            Decision(title: .april, subtitle: "The second quarter of the year starts with an HR training on how to be a great leader. \n\nEveryone in the company attends it and are told there is a follow-up course, in june, for only the highest-performing of workers. \n\nYou know it's going to be hard, but consider applying anyway...", callToAction: "do you apply?", choices: [
                Choice(title: "Apply for the course", subtitle: "Your boss is so proud of you! But, you know it's going to be necessary to make a few sacrifices along the way to becoming a high-performing employee...", stressValue: 10, successValue: 20, tag: .course),
                Choice(title: "Don't apply for the course", subtitle: "Your boss is disappointed in you! But, at least, as you are not going to have to focus on the course, you'll have plenty of time to work on your regular activities.", stressValue: 0, successValue: 5)
            ]),
            Decision(title: .may, subtitle: "In May, you were met with a huge problem that required senior-level access to fix. \n\nBut, the person who grants the access was on vacation, and only returned to work at the third week of the month.", callToAction: "How can you fix this problem?", choices: [
                Choice(title: "Try to bypass bureaucracy and get someone else to fix the problem for you", subtitle: "You had a coworker from a different department enter the system and fix the error, but you feel that was a little risky, so you did not take credit for it.", stressValue: 5, successValue: 10),
                Choice(title: "Wait for the time it takes for the person to come back", subtitle: "Your boss was angry that you took too long to fix the problem, but was ultimately satisfied that it was done so well.", stressValue: 15, successValue: 25)
            ]),
            Decision(title: .june, subtitle: "Knowing you have a bit more time on your hands, your boss hands you a list of activities you could choose to do this month in order to deliver more value to the stakeholders. \n\nThe alternative would be sticking to your current workload...", callToAction: "what will you do?", choices: [
                Choice(title: "Do the bare minimum necessary for that month", subtitle: "You knew you had too much on your plate as it was, so feel like it was a wise decision to leave the list alone, for now.", stressValue: 0, successValue: 10),
                Choice(title: "Push yourself and try to make your boss proud", subtitle: "You definitely did make your boss extremely proud! He congratulates you for a great month's work and send you on your way, exhausted but fulfilled...", stressValue: 15, successValue: 30)

            ]),
            Decision(title: .july, subtitle: "At the start of the second semester, a new coworker joins your team. She is eager to learn and start performing as soon as possible! \n\nYour boss asks you to mentor and train her during the next three months.", callToAction: "Do you accept?", choices: [
                Choice(title: "Train the new coworker", subtitle: "Training your new coworker is heavy work, but it's extremely rewarding to see someone grow, and your leadership skills are noticed.", stressValue: 15, successValue: 30, tag: .coworker),
                Choice(title: "Politely refuse to train the new coworker", subtitle: "Your boss asks someone else on the team to do it and you lose this opportunity for developing leadership skills, but at least you are not overwhelmed with work.", stressValue: 0, successValue: 5)
            ]),
            Decision(title: .august, subtitle: "In August, someone said something. It got repeated. People started talking. Heads turned, whispers spread. The office felt different, a quiet buzz of new information. Office gossip at its finest. \n\nApparently, one of your coworkers had an affair with a manager from another team, but both of them are married to other people!! \n\nHow enticing...", callToAction: "will you gossip about this?", choices: [
                Choice(title: "Gossip about your coworker", subtitle: "Somehow, talking about someone else's problems makes you feel a little bit better, but it's wrong to feel this way, right??", stressValue: -10, successValue: 0),
                Choice(title: "Don't gossip about your coworker, their life is private", subtitle: "You are a righteous person, you would never bad-mouth someone. Your empathic behavior is admirable!", stressValue: 0, successValue: 10)
            ]),
            Decision(title: .september, subtitle: "The new coworker made a huge mistake and didn't tell anyone, until that mistake blew up in your face.", callToAction: "What do you do?", choices: [
                Choice(title: "Reach out and try to help her", subtitle: "You and your coworker, together, correct the problem and report it to your boss. He's satisfied.", stressValue: 15, successValue: 20),
                Choice(title: "Ignore this problem and focus on your own work", subtitle: "You focus on your own work this month, and let the person who trained the new employee help her out this time.", stressValue: 0, successValue: 10)
            ]),
            Decision(title: .october, subtitle: "Finally, the fourth quarter arrives. These are the last three months of the year, where you can truly make a difference and show everyone what you are about. \n\nCoincidentally, a new, big project is announced and your boss nominates you to represent your department. \n\nYou can choose to bring someone else to help you or try to deal with it on your own.", callToAction: "What do you do?", choices: [
                Choice(title: "Deal with this final project alone", subtitle: "You show you are capable of dealing with huge projects on your own and demonstrate autonomy. But, you know these are going to be really hard months...", stressValue: 20, successValue: 30),
                Choice(title: "Bring someone from your team to help you", subtitle: "You call someone from your team to help you on this project, which might be wise, considering the amount of work you already have to deal with.", stressValue: 10, successValue: 20, tag: .delegate)
            ]),
            Decision(title: .november, subtitle: "November brings a new challenge regarding the project: other departments have failed to do their parts of the work and now a lot of it has fallen on your hands.", callToAction: "What do you do?", choices: [
                Choice(title: "Do all the necessary work", subtitle: "The work is done and you are seen as an authority and respected by other people in the project. But, you question if it was worth it...", stressValue: 20, successValue: 20),
                Choice(title: "Do only your part and communicate your boss about the situation", subtitle: "You do what you feel is right. If the other departments didn't care enough to do their job, why would you do it? It's only fair that you do your part and that's it.", stressValue: 5, successValue: 10)
            ]),
            Decision(title: .december, subtitle: "December arrives with a creeping realization... you had scheduled a vacation for this month, but you must also finish the project until the end of the year...", callToAction: "What is more important to you?", choices: [
                Choice(title: "Take a vacation", subtitle: "That vacation really did help you relax... the world will not end if you are not working. Though, you wonder if your boss didn't expect you to stay and finish that project...", stressValue: -50, successValue: -20),
                Choice(title: "Postpone your vacation and finish the project", subtitle: "Postponing your vacation takes a huge toll on you... but maybe it was for the best - you wonder - as you could finish the project on time and your boss was happy. After this, it's time for a well earned rest...", stressValue: 40, successValue: 40)
            ])
        ]
    }
}

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
