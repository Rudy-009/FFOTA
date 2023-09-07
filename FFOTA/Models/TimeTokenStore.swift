import Foundation
import SwiftUI

class TimeTokenStore: ObservableObject {

    var timeStack = 0
    var weekString: [String] = [String](repeating: "", count: 7)
    //["2023-08-29", "2023-08-30", "2023-08-31", "2023-09-01", "2023-09-02", "2023-09-03", "2023-09-04"]
    var timesOfWeek: [Int] = [Int](repeating: 0, count: 7)
    //
    
    @Published var times: [String:Int] = [:]
    @Published var timeStackofaWeek = [Color](repeating: Color.white, count: 7)
    
    func fetchTasks() {
        //UserDefault에서 값을 불러오기
        times = UserDefaults.standard.object(forKey: "Times") as? [String : Int] ?? [:]
        
        //키가 오늘 날짜인 값을 timeStack에 갱신해주기
        //만약 오늘 날짜 키가 없다면 오늘 처음 앱을 켰다는 뜻
        let today: String = todayString()
        timeStack = times[today] ?? 0
        
        getTimeStackOfaWeek(times: times)
    }
    
    func saveTasks() {
        //UserDefault에 times: [String:Int]를 저장
        UserDefaults.standard.set(times, forKey: "Times")
    }
    
    func addTotal(){
        let today: String = todayString() //26
        
        //날짜를 비교
        if let total = times[todayString()] {
            //날짜가 넘어가지 않은 순간
            timeStack = total + 1
            times[today] = timeStack
            print("\(today) : \(total)")
            saveTasks()
            fetchTasks()
            return
        }
        
        //날짜가 넘어간 순간
        timeStack = 0
        times[today] = timeStack
        
        saveTasks()
        fetchTasks()
    }
    
    func showTime()-> Int {
        let today: String = todayString()
        return times[today] ?? 0
    }
    
    //오늘 날짜 "yyyy-MM-dd" 형태로 불러오기
    func todayString() -> String {
        let date: Date = Date() //
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: date)
        
        return today
    }
    
    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let day = formatter.string(from: date)
        
        return day
    }
    
    func weekArray() {
        weekString.removeAll()
        let calendar = Calendar.current
        let today: Date = Date()
        for dayIndex in 0...6 {
            let date = calendar.date(byAdding: .day, value: dayIndex - 6, to: today)!
            weekString.append(dateToString(date: date))
        }
    }
    
    func dictionaryToArray(week: [String]) {
        //0 index 예전 날짜, 6은 오늘 날짜
        timesOfWeek.removeAll()
        for index in 0...6 {
            let totalTimeOfDay = times[weekString[index]] ?? 0
            timesOfWeek.append(totalTimeOfDay)
        }
    }
    
    func getTimeStackOfaWeek(times: [String:Int]) {
        //1주일 날짜를 String으로 갖는 배열을 생성
        weekArray()
        //print(weekString)
        //["2023-08-29", "2023-08-30", "2023-08-31", "2023-09-01", "2023-09-02", "2023-09-03", "2023-09-04"]
        
        
        //이 배열을 통해 Dictionary에 접근
        //key가 있으면 값을 가져오고 key가 없으면 0을 가져옴
        //이에 맞춰 값을 갱신 (시간이 쌓이면 색이 바뀌고, 날짜가 넘어가면 칸이 바뀜)
        dictionaryToArray(week: weekString)
        
        for value in timesOfWeek {
            timeStackofaWeek.remove(at: 0)
            
            if value == 0 {
                timeStackofaWeek.append(Color(.white))
            } else if value < 60 {
                timeStackofaWeek.append(Color("one"))
            } else if value < 120 {
                timeStackofaWeek.append(Color("two"))
            } else if value < 180 {
                timeStackofaWeek.append(Color("three"))
            } else if value < 240 {
                timeStackofaWeek.append(Color("four"))
            } else {
                timeStackofaWeek.append(Color("five"))
            }
        }
    }
}
