# College Mate App 🎓📱

This "master" branch is the "main" branch of the repository, showcasing the latest version (i.e., version number 3.4) of the app. Older versions are preserved in their respective branches within this repository.

**College Mate** is a cross-platform Flutter application backed by Firebase that centralizes **academic updates**, **event management**, and **placement assistance** for students, faculty, various committees, and the Training & Placement (TnP) Cell. By moving notices, schedules, and collaboration tools into one secure mobile platform, College Mate streamlines communication and fosters an engaged campus community.

---

## ✨ Key Benefits

- **🔗 Centralized Hub:**  All college-wide information—events, notices, placements, and faculty messages—in one place.
- **⏱️ Real-Time Updates:**  Instant push notifications for new announcements, event reminders, and placement drive details.
- **👤 Role-Based Experience:**  Tailored dashboards for Students, Faculty, and TnP staff with permissions and view-limits.
- **🔒 Secure & Private:**  Firebase Authentication and Firestore security rules protect user data and maintain privacy.
- **🤝 Community Engagement:**  Built-in discussion forums, feedback modules, and event RSVP features to drive participation.
- **🎯 Career Support:**  Integrated placement drive listings, eligibility criteria, and one-tap registration for interviews.
- **📈 Scalable Architecture:**  Serverless Firebase backend auto-scales under peak loads without manual provisioning.
- **🔮 Future-Ready:**  Easily extendable with AI-driven recommendations, alumni networking, and virtual learning modules.

---

## 🎯 Key Features

- **Student & Admin Authentication**:  
  Secure sign-in via email/password; separate Student, Faculty, and TnP roles.  
- **Dashboard & Profile Management**:  
  View personalized schedules, notices, test results, and update your skills/resume.  
- **Event & Noticeboard**:  
  Create and browse campus events, seminars, club meetups, and official notices.  
- **Placement Drives**:  
  List upcoming company visits, eligibility filters, and “Apply” button with confirmation.  
- **Discussion Forums**:  
  Post questions, answer peers, and share resources by topic or course.  
- **Push Notifications**:  
  Automatic alerts for new posts, event changes, and placement drive openings.  
- **Analytics for TnP**:  
  Dashboard metrics—student signups, event attendances, drive registrations, response rates.  
- **Document & Resource Sharing**:  
  Upload/download lecture notes, assignment briefs, and placement materials via Firebase Storage.

---

## 🚀 Tech Stack

| **Layer**       | **Technology**                              |
| --------------- | ------------------------------------------- |
| Frontend        | Flutter (Dart)                              |
| Backend         | Firebase Authentication, Cloud Firestore    |
| File Storage    | Firebase Cloud Storage                      |
| Notifications   | Firebase Cloud Messaging                    |
| Dev Tools       | Android Studio, Flutter SDK

---

## 🔄 Work Flow of System

![](https://github.com/MrHAM17/College_Mate_App/blob/master/2.%20Rough%20Work%20%26%20Data/App%20Pics/Work%20Flow.png)

1. **User Login/Signup** via Firebase Auth.  
2. **Role Routing**: Student, Faculty, committees, or TnP dashboard.  
3. **Data Fetch**: Firestore streams notices, events, placements.  
4. **User Actions**: RSVP to events, apply to drives, post in forums.  
5. **Notifications**: Firestore triggers send real-time push alerts.  
6. **Analytics**: TnP cell monitors metrics via Firestore queries.

---

## 🏛️ Architecture

![](https://github.com/MrHAM17/College_Mate_App/blob/master/2.%20Rough%20Work%20%26%20Data/App%20Pics/Architecture.png)

---

## 📸 Screenshots
![](https://github.com/MrHAM17/College_Mate_App/blob/master/2.%20Rough%20Work%20%26%20Data/App%20Pics/Slide%201.PNG)
![](https://github.com/MrHAM17/College_Mate_App/blob/master/2.%20Rough%20Work%20%26%20Data/App%20Pics/Slide%202.PNG)
![](https://github.com/MrHAM17/College_Mate_App/blob/master/2.%20Rough%20Work%20%26%20Data/App%20Pics/Slide%203.PNG)
![](https://github.com/MrHAM17/College_Mate_App/blob/master/2.%20Rough%20Work%20%26%20Data/App%20Pics/Slide%204.PNG)
![](https://github.com/MrHAM17/College_Mate_App/blob/master/2.%20Rough%20Work%20%26%20Data/App%20Pics/Slide%205.PNG)
![](https://github.com/MrHAM17/College_Mate_App/blob/master/2.%20Rough%20Work%20%26%20Data/App%20Pics/Slide%206.PNG)
![](https://github.com/MrHAM17/College_Mate_App/blob/master/2.%20Rough%20Work%20%26%20Data/App%20Pics/Slide%207.PNG)
![](https://github.com/MrHAM17/College_Mate_App/blob/master/2.%20Rough%20Work%20%26%20Data/App%20Pics/Slide%208.PNG)
![](https://github.com/MrHAM17/College_Mate_App/blob/master/2.%20Rough%20Work%20%26%20Data/App%20Pics/Slide%209.PNG)


---

## 📂 Reports & Docs

- **Project Report**:   https://github.com/MrHAM17/College_Mate_App/blob/master/1.%20All%20Project%20IMP%20Docs/Project%20Report/Sem_6_Mini_Project_College_Mate_Project_Report.pdf
- **All Pics**: https://github.com/MrHAM17/College_Mate_App/tree/master/2.%20Rough%20Work%20%26%20Data/App%20Pics

---

## 🛠️ Getting Started

1. **Clone the repo**  
   - Using Git
   - Or download the ZIP file and extract it manually.
2. **Install dependencies**  
   ```bash
   flutter pub get
   ```
3. **Configure Firebase**  
   - Add your `google-services.json` to `android/app/`
   - Ensure Firebase Authentication, Cloud Firestore, and Firebase Storage are enabled in your Firebase Console.
4. **Run on device/emulator**  
   ```bash
   flutter run
   ```

---

## 🤝 Contributing

1. Fork the repo  
2. Create a feature branch (`git checkout -b feature/YourFeature`)  
3. Commit your changes (`git commit -m "feat: add ..."`)  
4. Push to the branch (`git push origin feature/YourFeature`)  
5. Open a Pull Request

