module ApplicationHelper
    def page_title(title = '')
        app_title = 'お気に入りが見つかる日用品管理アプリ'
        title.present? ? "#{title}" : app_title
    end
end
