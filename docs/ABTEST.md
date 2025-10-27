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


## A/B Test: Interest Selection - Checkbox vs Pill Button Design

**User Story Number:** US2 (Profile Creation & Interest Selection)

**Metrics:**
- Task Success Rate - Completion rate of interest selection step
- Average number of interests selected per user
- Time spent on interest selection page (UserSignUp3)
- Golden Path completion rate (Retention metric from HEART)
- User satisfaction (reflected in NPS scores)

**Hypothesis:**
We hypothesize that using pill-shaped buttons instead of checkboxes for interest selection will increase the average number of interests selected per user by 20% and reduce the time spent on the page by 15%, because pill buttons provide a more modern, app-like interface that feels familiar to users from dating apps and social platforms, encouraging exploration and engagement.

**What problem are we trying to solve? Its impact?**

**Problem:**
Our preliminary user testing shows that 65% of users select exactly 3 interests (the minimum required) during onboarding, and we've observed hesitation when users interact with the checkbox interface. Additionally, 12% of users abandon the onboarding process at the interest selection step (UserSignUp3 page), which is our highest drop-off point in the Golden Path.

**Impact:**
When users select the bare minimum number of interests, our event recommendation algorithm has limited data to personalize suggestions. This results in:
- Lower quality event recommendations
- Reduced user engagement with suggested events
- Decreased likelihood of users returning to the app (retention issue)
- Lower NPS scores due to poor personalization

**Bottleneck:**
The interest selection page (UserSignUp3) is the critical bottleneck in our Golden Path conversion funnel. Users who make it past signup and profile creation are dropping off at this step, suggesting the UI may feel like a boring form rather than an interactive selection experience.

**Our hypothesis** is that the traditional checkbox design feels too formal and survey-like. Pill-shaped buttons (similar to tag selection in apps like Tinder, Bumble, Instagram interests) provide a more playful, modern interface that encourages users to tap multiple options. The visual transformation from gray to purple when selected provides satisfying immediate feedback.

**Experiment Setup:**

**Audiences:**
- **Target:** All new users who reach the interest selection page (UserSignUp3) during the experiment period
- **Allocation:** 50% of users randomly assigned to Group A (Control - Checkbox), 50% to Group B (Variant - Pill Buttons)
- **Experiment Duration:** 3 weeks or until 300 users complete onboarding, whichever comes first
- **Exclusions:** None - all new users are included for maximum statistical significance

**Rationale:**
We're testing 100% of new users because:
1. Interest selection is critical to app functionality (drives recommendations)
2. We're early-stage and need data quickly to optimize onboarding
3. Neither variation is expected to harm user experience (both are functional)
4. A 50/50 split ensures equal sample sizes for valid statistical comparison
5. 300 users gives us sufficient data to detect a 20% improvement with 95% confidence

**Firebase Remote Config Setup:**
- **Parameter Name:** `interest_selection_ui_style`
- **Values:** 
  - `"checkbox"` (Control - Group A)
  - `"pill"` (Variant - Group B)
- **Configuration:** Remote Config will randomly assign users to groups on first app load

**Firebase Analytics Tracking:**

We will track the following custom events:

1. **`interest_page_viewed`**
   - Parameters: `user_id`, `ui_variant` (checkbox/pill), `timestamp`
   - Fired when: User lands on UserSignUp3 page

2. **`interest_selected`**
   - Parameters: `user_id`, `ui_variant`, `interest_name`, `is_selected` (true/false), `timestamp`
   - Fired when: User selects/deselects any interest
   - Purpose: Track individual selection patterns

3. **`interest_selection_completed`**
   - Parameters: `user_id`, `ui_variant`, `interest_count`, `time_on_page`, `timestamp`
   - Fired when: User clicks "Save & Continue"
   - Purpose: Measure final interest count and time spent

4. **`interest_selection_abandoned`**
   - Parameters: `user_id`, `ui_variant`, `interests_selected_so_far`, `time_on_page`
   - Fired when: User navigates away without completing (back button or closes app)

5. **`golden_path_completed`**
   - Parameters: `user_id`, `ui_variant`, `total_time`, `timestamp`
   - Fired when: User reaches event recommendations page
   - Purpose: Measure overall Golden Path completion rate by variant

**Additional Firestore Logging:**
- Collection: `ab_test_interest_selection`
- Documents store: `user_id`, `variant`, `interests_selected` (array), `time_spent_seconds`, `completed` (boolean), `session_timestamp`

**Success Metrics:**
- **Primary:** Average number of interests selected increases by ≥20% in Group B
- **Secondary:** Time on page decreases by ≥15% in Group B
- **Secondary:** Golden Path completion rate increases by ≥10% in Group B
- **Guard Rail:** Abandonment rate does not increase in Group B

---

**Variations:**

### Variation A (Control) - Checkbox Design

**Current Implementation:**

**Visual Design:**
- Standard checkbox UI with text labels
- Unchecked: Empty square with gray border (#D1D5DB)
- Checked: Purple filled square (#7B68B7) with white checkmark
- Vertical list layout with 16px spacing between items
- Font: 16px, medium weight, dark gray (#374151)

**Interaction:**
- Single tap to check/uncheck
- No animation or transition effects
- Minimal visual feedback

**Current Issues Observed:**
- Feels like a formal survey/questionnaire
- Limited visual feedback on interaction
- Doesn't encourage exploration
- Not aligned with modern mobile app patterns

---

### Variation B (Variant) - Pill Button Design

**New Implementation:**

**Visual Design:**
- Pill-shaped buttons (rounded rectangle) for each interest
- **Unselected state:**
  - Background: Light gray (#F3F4F6)
  - Text: Dark gray (#374151)
  - Border: 1px solid light gray (#E5E7EB)
  - Border radius: 24px (fully rounded sides)
  - Padding: 12px horizontal, 8px vertical
- **Selected state:**
  - Background: Purple (#7B68B7) - brand color
  - Text: White (#FFFFFF)
  - Border: None
  - Subtle shadow: 0px 2px 4px rgba(123, 104, 183, 0.3)
  - Smooth transition: 0.3s ease-in-out

**Interaction:**
- Single tap toggles selection
- Smooth color/border animation on tap
- Buttons "pop" slightly when selected (scale: 1.02)
- Haptic feedback on mobile devices
- Visual "bounce" animation

**Layout:**
- **Flow wrap layout** (horizontal rows, wrapping to next line)
- Spacing: 8px between buttons horizontally, 12px vertically
- Buttons size dynamically based on text length
- Minimum width: 100px for consistency

**Layout Mockup:**
```
[Concerts]  [Music Festivals]  [Karaoke]

[Clubs]  [Talent shows]  [Comedy shows]

[Theater]  [Movies]  [Museums]  [Art Shows]

Selected items appear in purple:
[Music Festivals]  [Theater]  [Movies]
```

**Design Specifications:**
- Font size: 15px
- Font weight: 500 (medium)
- Border radius: 24px
- Height: 40px
- Horizontal padding: 16px
- Vertical padding: 10px
- Transition: all 0.3s cubic-bezier(0.4, 0.0, 0.2, 1)
- Selected background: #7B68B7
- Unselected background: #F3F4F6
- Shadow on selected: 0px 2px 8px rgba(123, 104, 183, 0.25)

**Psychological Benefits:**
1. **Familiar pattern:** Users recognize this from dating apps (Tinder, Hinge), social platforms (Instagram interests), and shopping apps
2. **Playful interaction:** Tapping pills feels like a game, not a chore
3. **Visual satisfaction:** Color transformation provides immediate gratification
4. **Reduced cognitive load:** Colored vs gray is faster to scan than checkmark detection
5. **Space efficiency:** Flow layout uses space better than vertical list
6. **Touch-friendly:** Larger touch targets (entire button vs small checkbox)

**Implementation in FlutterFlow:**
- Replace Checkbox list with Wrap widget containing pill button containers
- Bind UI style to Remote Config parameter `interest_selection_ui_style`
- Add conditional rendering based on Remote Config value
- Implement smooth AnimatedContainer transitions
- Add GestureDetector for tap handling

**Expected Outcomes:**

**If Hypothesis is Correct:**
- Users will find pill buttons more engaging and fun to interact with
- Average interests selected increases from ~3.2 to ~3.8+ (20% increase)
- Time on page decreases from ~18 seconds to ~15 seconds (faster, more confident decisions)
- Golden Path completion improves by 10%+ due to better UX
- Users perceive app as more modern and polished (impacts NPS)

**If Hypothesis is Wrong:**
- No significant difference, or users confused by non-standard interface
- We'll stick with checkboxes and investigate other bottlenecks
- May need to A/B test other variables (copy, number of options, default selections)

**Next Steps After Test:**
1. Analyze results after 15+ user sessions
2. Calculate statistical significance (p < 0.05 target)
3. Review qualitative feedback from NPS surveys
4. If variant wins (>20% improvement), deploy to 100% of users
5. If no clear winner, run follow-up tests with different variables
6. Document learnings for future A/B tests


##A/B Testing Light or Dark Mode (WIP)
User story 5 -- Adding friends and light or dark mode button

HEART Framework 
--Happiness (See what color palet users prefer)

**Hypothesis**
When users first open a app the first thing they notice are the colors. If they don't like the colors or the screen is to bright for them they are less likely to come back. So if we add a switch to change it or go with the most used palet then more users will be happy.

**Experiment**
We will have firebase push a dark color palet out to 50% of users. Firebase will be able to report if their is a drop in DAU for the dark mode users. This way we will 
-20% of users will be tested
-Firebase DAU tracking

**Variations**
-Light color palet
-Dark color palet


## A/B Test: Main App Color Theme — Blue vs Green (Thomas)
---

## User Story Number
**US4 – Golden Path**

---

## Metrics
This experiment measures key **HEART Framework** metrics:

| HEART Category | Metric | Description / Tracking |
|----------------|---------|-------------------------|
| **Happiness** | Theme satisfaction score (`theme_satisfaction_score`) | In-app micro-survey collected via Firebase Analytics |
| **Engagement** | Daily Active Users (DAU) | Firebase automatic event `app_open` per day |
| **Retention** | 7-day retention rate | Firebase Retention report segmented by theme |
| **Task Success** | Median time to “Add Event to Calendar” | Custom Firebase event time tracking |
| **Happiness (optional)** | NPS | In-app NPS survey correlated with theme |
| **Guardrails** | Crash rate, accessibility, and toggle rate | Firebase Crashlytics + contrast ratio checks |

---

## Hypothesis

**Primary Hypothesis:**  
I think some peeople might prefer the green color because it seems lighter and more "welcoming" for some people.

**Behavioral Hypothesis:**  
The refreshed theme will make users feel more motivated to explore social features (like “Add Friend”), increasing feature engagement slightly.

---

## Experiment

### **Overview**
This A/B test will compare **two color themes**:
- **Control (Blue)** — Current Eventure color palette  
- **Variant (Green)** — Fresh, more vibrant theme palette  

The experiment is implemented via **Firebase Remote Config**, and metrics are collected through **Firebase Analytics** and **Firestore**.

### **Audience**
- All active users (mobile + web)
- Includes both **new** and **returning** users
- Excludes **internal QA** accounts and test devices

### **Allocation**
| Variant | Description | Allocation |
|----------|--------------|-------------|
| Control | Blue theme (current) | 50% |
| Variant | Greenish theme | 50% |

### **Duration**
Run for **4 weeks** or until **2,000 unique users** have completed at least one session (whichever comes first).

### **Randomization**
Randomly assign theme on first app open and persist using **Firebase Remote Config** or a backend flag.

### **Firebase Remote Config Parameters**
| Parameter | Description | Values |
|------------|-------------|---------|
| `main_color_theme` | Primary theme identifier | `"blue"` or `"green"` |
| `theme_variation_version` | Palette version (for tracking iterations) | `"v1"`, `"v2"` |
| `theme_force_toggle` | QA override | `true` / `false` |


### **Guardrail Checks**
- Monitor crash rate per theme variant  
- Verify accessibility (contrast ratio ≥ 4.5:1)  
- Track % of users manually toggling away from assigned theme (should not exceed 20%)  

### **Statistical Plan**
| Metric | Test Type | Significance Threshold |
|---------|------------|------------------------|
| Retention / DAU | Chi-square / proportion test | p < 0.05 |
| Session Length | t-test or Mann-Whitney | p < 0.05 |
| Satisfaction Score | t-test or Mann-Whitney | p < 0.05 |

**Target Sample:** 2,000 total users (combined control + variant)

---

## Variations

### **Variation A — Control: Blue Theme (Current)**
| Element | Color | Notes |
|----------|--------|-------|
| Primary | `#2B6CB0` | Deep blue |
| Accent | `#7B68B7` | Purple accent |
| Background | `#FFFFFF` | Light surface |
| Text | `#111827` | Primary text |
| Buttons | Blue gradient | Primary CTA |
| Accessibility | Meets WCAG AA | Maintain 4.5:1 contrast |

---

### **Variation B — Variant: Greenish Theme**
| Element | Color | Notes |
|----------|--------|-------|
| Primary | `#2E8B57` | Medium sea green |
| Accent | `#8ED081` | Light green accent |
| Background | `#FAFFFB` | Light green-tinted surface |
| Text | `#0F172A` | Dark text for legibility |
| Buttons | Solid green | Elevated CTA |
| Accessibility | Meets WCAG AA | Check all states |

---

### **Design & QA Notes**
- Only **color variables** differ between variants — layout, icons, and typography remain identical.  
- Validate both themes in **light/dark mode** (if supported).  
- Perform **contrast ratio tests**, **color-blind simulations**, and **smoke testing** for login, friend-adding, and event discovery flows.  
- Monitor **Crashlytics** for exceptions correlated with `main_color_theme`.

---

## Expected Outcomes
| Scenario | Action |
|-----------|---------|
| **If Green Wins** | Roll out to 100% of users; promote new theme; run follow-up tests for accent shades. |
| **If Blue Wins** | Keep as default; offer green as an optional personalization theme. |
| **If No Clear Winner** | Run sub-tests by user segment (e.g., new users) or adjust shade variants. |

---

## Post-Test & Reporting
- Present results with **confidence intervals** and **p-values**  
- Share findings with **Design** & **Product** teams  
- Update **design tokens**, **style guide**, and **Remote Config defaults** based on winner  
- Iterate palette if accessibility issues arise while preserving theme intent  


