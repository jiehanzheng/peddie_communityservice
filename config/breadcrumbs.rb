crumb :root do
  link "Home", root_path
end

crumb :committee do |committee|
  link committee.name, committee
  parent :root
end

crumb :shift do |shift|
  link "Shift #" + shift.position.to_s
  parent :committee, shift.committee
end

crumb :signup do |signup|
  link "Sign up"
  parent :shift, signup.shift
end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).