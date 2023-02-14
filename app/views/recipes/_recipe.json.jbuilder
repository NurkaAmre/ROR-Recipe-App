json.extract! recipe, :id, :name, :description, :public, :preparation_time, :cooking_time, :user_id, :created_at,
              :updated_at
json.url recipe_url(recipe, format: :json)
