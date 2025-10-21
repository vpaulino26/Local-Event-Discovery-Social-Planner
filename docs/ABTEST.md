### A/B Test Name: Event Card Layout: Compact vs. Expanded View

User Story Number: US4 – Golden Path (Event Discovery and Calendar Integration)

Metrics: 
- CTR (Click-Through Rate) for Events
- Engagement (time spent on event list)
- Adoption (first event added to calendar)
- Task Success (median time to add event to calendar)

Hypothesis: 
- Users presented with a Compact Event Card Layout (showing key info like title, date, and location only) will browse faster, click more events, and have higher adoption rates than users shown the Expanded Layout (which includes event descriptions and images).
- During internal testing, users spent extra time scrolling through the event feed and reported that it felt “cluttered” or “overwhelming.” Analytics also showed that the average scroll depth was low, meaning users rarely reached events lower in the list.
This suggests a bottleneck in event discovery — users might not be clicking events simply because the UI makes browsing slower and more visually dense.
By simplifying the event cards, we hope to make browsing easier, increasing event CTR and eventually adoption (more users adding events to their calendar).

Experiment:
We’ll use Firebase Remote Config and Firebase A/B Testing to randomly assign users to one of two UI variants:
- 50% of users → Control Group (Expanded Layout)
- 50% of users → Variant A (Compact Layout)
Each user will stay in their assigned layout group for 30 days.
Tracking (Firebase Analytics):
- event_click — logged when a user clicks an event from the home screen.
- view_event_list — logged each time a user opens the event list.
- add_to_calendar — logged when a user adds an event to their calendar.
- calendar_add_time — records time between click and calendar update.
HEART Metrics tracked: CTR, Engagement, Adoption, Task Success.
Firebase will compare CTR and median “add to calendar” time between groups.

Variations:

Variation A – Compact Layout (Test):
- Event cards show only: Event Title, Date, Location, and a small image icon.
- No event description or long image preview in the list.
Control – Expanded Layout (Current):
- Event cards show full image, title, date, location, and brief description.
Design Rationale:
The Compact layout reduces scrolling fatigue and cognitive load, allowing faster browsing and more clicks.
