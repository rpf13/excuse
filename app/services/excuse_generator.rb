class ExcuseGenerator
  GREETING = "Hi team colleagues,".freeze

  HEALTH_LEADS = [
    "I woke up with a fever, a rough cough, and enough body aches that getting across town would be a bad idea",
    "I have been dealing with a stomach bug since late last night and the nausea still comes in waves",
    "I woke up with chills, a sore throat, and the kind of fatigue that usually means I should stay away from shared rooms",
    "I have a chesty cough and a low fever this morning, so I am clearly better off keeping my germs to myself",
    "I slept badly because of sinus pressure, congestion, and a pounding head, and the symptoms have not eased yet",
    "I am feeling dizzy, run down, and generally not fit for a commute after a pretty miserable night",
    "I have the sort of head cold that makes concentrating possible but traveling unnecessarily feel irresponsible",
    "I woke up achy, congested, and feverish enough that I should not be in a packed office today"
  ].freeze

  HEALTH_IMPACTS = [
    "and I do not want to bring that into meeting rooms or shared desks",
    "and the commute would burn the little energy I have before the actual work even starts",
    "and a quieter setup at home is the only way I can stay productive without dragging this out",
    "and staying home is the most sensible way to keep working while I recover responsibly"
  ].freeze

  RECOVERY_LEADS = [
    "I am recovering from last week's flu and I am at that awkward stage where I can work but I still tire out quickly",
    "I am on the mend after a respiratory infection, but the lingering cough and fatigue are still very real",
    "I am recovering from a stomach issue and I still need the flexibility of being at home while things settle fully",
    "I am coming out of a heavy cold, but my energy level is still unpredictable enough that commuting would be pushing it",
    "I am mostly past this bug, but I still have enough dizziness and brain fog that I need a calmer setup",
    "I am recovering well, just not well enough for the office trip to make sense yet",
    "I am in that post-illness stage where I can contribute steadily if I pace myself, but not if I add a commute",
    "I am technically back on my feet after being sick, but only if I keep the day measured and low-friction"
  ].freeze

  RECOVERY_IMPACTS = [
    "and I would rather spend my limited energy on actual work than on getting into the office",
    "and one more quiet day at home should help me avoid sliding backward",
    "and I am trying to be sensible so I do not turn a nearly-finished recovery into another lost day",
    "and staying home lets me keep the day sustainable while still being fully online"
  ].freeze

  HEADACHE_LEADS = [
    "I woke up with a migraine aura and I can already tell bright lights and travel would make it worse",
    "I have a strong tension headache running from the back of my neck to behind my eyes",
    "I have had a headache building since before sunrise and it has not responded well to medication yet",
    "I am dealing with sinus pressure and a headache that gets much worse whenever I am in transit",
    "I woke up with a pounding headache and very little sleep, which is not a great combination for commuting",
    "I have one of those low, steady headaches that stays manageable only if I keep the day quiet and structured",
    "I am dealing with light sensitivity and a stubborn headache that would not mix well with the office",
    "I have the kind of headache that feels possible to work through, but only from a calmer environment"
  ].freeze

  HEADACHE_IMPACTS = [
    "and the noise, movement, and screen glare of the office would almost certainly push it further",
    "and I know from experience that a commute will make the whole day harder than it needs to be",
    "and I will be much more useful from a quiet home desk than from a bright, busy room",
    "and the practical option is to control noise and light from home while still getting my tasks done"
  ].freeze

  CARE_LEADS = [
    "my niece is home unwell and I am the family fallback who needs to cover the day",
    "my nephew's usual care arrangement fell through this morning and I am the only available adult",
    "my niece's daycare had a short-notice closure, so I need to stay home and supervise her",
    "my nephew is recovering from a fever and he still needs someone nearby for the day",
    "my sister had a last-minute appointment come up and asked me to take care of my niece",
    "my nephew's class was sent home unexpectedly, and there was no backup plan that covered the whole day",
    "my niece has a follow-up appointment after being sick this week, and I need to be around before and after it",
    "my nephew had a difficult night and is still under the weather, so I need to stay with him today"
  ].freeze

  CARE_IMPACTS = [
    "and trying to piece together an office day around that would create more disruption than it solves",
    "and home office is the only realistic way for me to stay available to both work and family today",
    "and I can keep everything moving from my home setup far more reliably than by attempting a partial commute",
    "and I would rather stay reachable online all day than disappear into a logistics problem"
  ].freeze

  LOGISTICS_LEADS = [
    "my apartment building scheduled an urgent water shutoff and the plumber can only access my flat during office commute hours",
    "my internet provider moved an essential repair to this morning and the technician needs access inside a narrow time window",
    "my heating system decided to stop cooperating overnight and a repair visit was the only slot I could get",
    "my building management booked emergency maintenance for today and I need to be here to let the crew in",
    "there is a major transit disruption on my route this morning that turns the commute into an unpredictable project of its own",
    "I am waiting on a critical home office equipment delivery that finally got confirmed for today after several reschedules",
    "my power was unstable overnight and I need to stay home while the electrician checks the apartment setup",
    "there is a building inspection at my place this morning that cannot be moved and requires someone present"
  ].freeze

  LOGISTICS_IMPACTS = [
    "and the cleanest option is to work from home around it rather than lose the day to scheduling chaos",
    "and once that is handled I will be in a much better position to stay productive from here",
    "and it is more practical to stay local, keep my laptop open, and work between the access windows",
    "and home office gives me the flexibility to manage it without dropping off the map"
  ].freeze

  FUNNY_LEADS = [
    "my smoke detector picked this morning to start its low-battery protest song and the replacement appointment is happening now",
    "my kitchen tap has developed a dramatic splash radius and the plumber described it as urgent in a tone that felt uncomfortably sincere",
    "my cat managed to knock my backup router off the shelf overnight, so I am supervising the replacement setup from home",
    "my building is testing the fire alarm system floor by floor today, which is somehow both real and very on-brand for a Monday",
    "my desk chair finally gave up in spectacular fashion, and the only same-day replacement delivery window is this morning",
    "the parcel with my new laptop charger is arriving today after several failed attempts, and without it my battery confidence is mostly fictional"
  ].freeze

  FUNNY_IMPACTS = [
    "and while it sounds mildly ridiculous, handling it from home is still the fastest route back to a normal workday",
    "and it is one of those annoyingly believable home problems that is easier to solve if I stay local",
    "and the sensible move is to sort it out here while keeping my meetings and messages fully covered",
    "and I would prefer to turn it into a controlled inconvenience rather than a full-day saga"
  ].freeze

  CLOSINGS = [
    "while staying online for messages, meetings, and focused work.",
    "while keeping Slack open and the rest of my day moving as normally as possible.",
    "while remaining reachable and handling my priorities from my home desk.",
    "while making sure work continues smoothly from a quieter setup."
  ].freeze

  TOPIC_GROUPS = {
    health: [HEALTH_LEADS, HEALTH_IMPACTS],
    recovery: [RECOVERY_LEADS, RECOVERY_IMPACTS],
    headaches: [HEADACHE_LEADS, HEADACHE_IMPACTS],
    care: [CARE_LEADS, CARE_IMPACTS],
    logistics: [LOGISTICS_LEADS, LOGISTICS_IMPACTS],
    funny: [FUNNY_LEADS, FUNNY_IMPACTS]
  }.freeze

  EXCUSES = begin
    catalog = []

    TOPIC_GROUPS.each_value do |leads, impacts|
      leads.product(impacts, CLOSINGS) do |lead, impact, closing|
        catalog << "#{GREETING} #{lead}, #{impact}, so I need to work from home today #{closing}"
      end
    end

    catalog.uniq.freeze
  end

  def self.generate(random: Random)
    EXCUSES.sample(random: random)
  end

  def self.count
    EXCUSES.size
  end

  def self.topic_count
    TOPIC_GROUPS.size
  end
end
