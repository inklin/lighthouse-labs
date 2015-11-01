class Boat
  def allowed_aboard?(inventory)
    inventory.include?('life jacket')
  end
end