defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end

defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{name: name}) when name != "" do
    IO.puts "Very Cheap badge for #{name}"
  end

  def print_vip_badge(%Attendee{}) do
    raise "missing name for badge"
  end
end

#
# nested
#
defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1 
end

# report = %BugReport{owner: %Customer{name: "Sasa", company: "SoniINC"}, details: "broken!!!"}
# iex(10)> report.owner.name
# "Sasa"
# iex(11)> put_in(report.owner.name, "SSAA")
# %BugReport{
#   details: "broken!!!",
#   owner: %Customer{company: "SoniINC", name: "SSAA"},
#   severity: 1
# }
# iex(13)> update_in(report.owner.name, &("Mr. " <> &1) )
# %BugReport{
#   details: "broken!!!",
#   owner: %Customer{company: "SoniINC", name: "Mr. Sasa"},
#   severity: 1
# }
