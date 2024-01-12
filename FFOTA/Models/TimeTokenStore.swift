import SwiftUI

class TimeTokenStore: ObservableObject {

    var timeStack = 0
    var weekString: [String] = [String](repeating: "", count: 7)
    var timesOfWeek: [Int] = [Int](repeating: 0, count: 7)
    
    // DateFormatter를 함수 외부에 정의하고 초기화
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    @Published var times: [String:Int] = [:]
    @Published var timeStackofaWeek = [Color](repeating: Color.white, count: 7)
    
    func loadAndUpdateTodayTimeStack() {
        // UserDefaults에서 값을 불러와 times 딕셔너리 초기화
        times = loadTimesFromUserDefaults()
        
        // 오늘 날짜의 시간 스택 갱신
        timeStack = updateTimeStackForToday()
        
        // 다른 작업을 수행할 수 있는 함수 호출
        getTimeStackOfaWeek(times: times)
    }

    // UserDefaults에서 값을 불러오는 함수
    func loadTimesFromUserDefaults() -> [String: Int] {
        return UserDefaults.standard.dictionary(forKey: "Times") as? [String: Int] ?? [:]
    }
    
    // 오늘 날짜의 시간 스택을 갱신하는 함수
    func updateTimeStackForToday() -> Int {
        let todayKey = keyForToday()
        return times[todayKey] ?? 0
    }

    // 현재 날짜의 문자열을 생성하는 함수
    func keyForToday() -> String {
        return dateFormatter.string(from: Date())
    }
    
    func saveTasks() {
        //UserDefault에 times: [String:Int]를 저장
        UserDefaults.standard.set(times, forKey: "Times")
    }
    
    //1초마다 키의 값에 +1초 더해주기
    //하루가 넘어가면
    func updateTotalCount() {
        let today = keyForToday()
        
        if var total = times[today] {
            total += 1
            timeStack = total
        } else {
            timeStack = 0
        }
        
        times[today] = timeStack
        
        saveTasks()
        loadAndUpdateTodayTimeStack()
        
        //print("\(today) : \(timeStack)")
    }
    
    func showTime()-> Int {
        let today: String = keyForToday()
        return times[today] ?? 0
    }
    
    func stringFromDate(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    func weekArray() {
        let calendar = Calendar.current
        let today: Date = Date()
        
        weekString.removeAll()
        
        weekString = (0..<7).map { dayIndex in
            let date = calendar.date(byAdding: .day, value: dayIndex - 6, to: today)!
            return stringFromDate(date: date)
        }
    }
    
    func dictionaryToArray(week: [String]) {
        //0 index 예전 날짜, 6은 오늘 날짜
        timesOfWeek.removeAll()
        
        let timesOfWeek = (0..<7).map { index in
            return times[weekString[index], default: 0]
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
