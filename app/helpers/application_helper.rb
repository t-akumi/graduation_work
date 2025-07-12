module ApplicationHelper
    def page_title(title = '')
        app_title = 'お気に入りが見つかる日用品管理アプリ'
        title.present? ? "#{title}" : app_title
    end

    def default_meta_tags
        {
          site: 'お気に入りが見つかる日用品管理アプリ',
          title: 'お気に入りが見つかる日用品管理アプリ',
          reverse: true,
          charset: 'utf-8',
          description:'日用品を自動で管理しつつ、お気に入りの商品も共有できるwebアプリです。',
          keywords: '日用品、管理、投稿',
          canonical: "https://www.stockandpost.com",
          separator: '|',
          og:{
            site_name: :site,
            title: :title,
            description: :description,
            type: 'website',
            url: "https://www.stockandpost.com",
            image: image_url('app_face.png'),
            local: 'ja-JP'
          }
        }
    end
end
