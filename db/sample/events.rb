# frozen_string_literal: true

FactoryBot.create :event,
  topic: "Examining Effects of Mismanagement of the Cormorant in the Great "\
         "Lakes Region",
  occurs_at: Time.current.beginning_of_week.noon,
  location: "SH-216"

FactoryBot.create :event,
  topic: "Hearings to examine the Inspector General's first report on "\
         "Department of Justice and Federal Bureau of Investigation actions in"\
         "advance of the 2016 presidential election.",
  occurs_at: Time.current.next_week.noon,
  location: "SD-538"

FactoryBot.create :event,
  topic: "Hearings to examine the Inspector General's first report on "\
         "Department of Justice and Federal Bureau of Investigation actions in"\
         "advance of the 2016 presidential election.",
  occurs_at: 2.days.from_now,
  location: "SD-538"

FactoryBot.create :event,
  topic: "Hearings to examine the Inspector General's first report on "\
         "Department of Justice and Federal Bureau of Investigation actions in"\
         "advance of the 2016 presidential election.",
  occurs_at: Time.current.next_week.end_of_hour,
  location: "SD-538"

FactoryBot.create :event,
  topic: "Oversight of the ATF National Canine Division",
  occurs_at: Time.current.last_week.noon,
  location: "CHOB-334"
