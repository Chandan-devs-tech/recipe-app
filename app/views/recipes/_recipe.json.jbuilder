json.extract! recipe, :id, :name, :preparation_time, :cook_time, :description, :public, :user_id, :created_at,
              :updated_at
json.url recipe_url(recipe, format: :json)
