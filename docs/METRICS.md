[Link to HEART Framework](https://docs.google.com/presentation/d/1voAYue-iTCJlopnTJ37daRBn8V4-0Iy3P8BbXQLeaYs/edit?usp=sharing)

## Metrics in HEART Framework
- NPS
- Adoption
- DAU
- Retention
- CTR for an event on the Golden Path. This is done with Firebase Analytics custom event.
- Median time to add event to calendar - Tracking how long it takes after clicking the 'add event to calendar' button for user's calendar to update

## Metrics Collection Details

### Happiness Metrics (cam)
- **NPS (Net Promoter Score)**: Could be collected via in-app survey presented to users after they complete their first successful event discovery (end of Golden Path). A modal dialog appears asking "How likely are you to recommend Eventure to a friend or colleague?" with a 0-10 rating scale. Response is stored in Firestore collection `nps_responses` with fields: `user_id`, `score` (0-10), `timestamp`, `user_journey_stage` ("post_golden_path"). An optional follow-up question "What's the primary reason for your score?" captures qualitative feedback in field `feedback_text`. NPS calculated monthly by categorizing responses: Promoters (9-10), Passives (7-8), Detractors (0-6), using formula: NPS = % Promoters - % Detractors. Dashboard visualization created using Firebase Analytics custom event `nps_survey_completed` with parameters `score` and `category`.

### Adoption Metrics (cam)
- **Adoption (New User Signups)**: Tracked automatically through Firebase Authentication. Each new account creation is recorded with Firebase automatic event `sign_up` which includes parameters `method` (email/password), `timestamp`, and `user_id`. Retrieved from Firebase Authentication dashboard under "Users" tab showing user creation dates. Growth tracked as new authenticated users per day/week/month. No additional implementation needed - Firebase Auth handles this automatically.

