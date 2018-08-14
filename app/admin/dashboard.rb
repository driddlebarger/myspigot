ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  content title: proc{ I18n.t("active_admin.dashboard") } do
    

    # Here is an example of a simple dashboard with columns and panels.
    #
    section "Users" do
        div do
            line_chart User.group_by_week(:created_at).count        
        end
    end

    section "Locations" do
        div do
             line_chart Location.group_by_week(:created_at).count  
        end
    end

  end
end
