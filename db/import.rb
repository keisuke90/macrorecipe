require 'csv'

CSV.foreach('test_data.csv').each_slice(10) do |rows|
  foods = []
  rows.each do |row|
    name = row[0]
    kcal = row[1]
    protein = row[2]
    fat = row[3]
    carbo = row[4]
    time = Time.current
    foods <<
      {
        name: name,
        kcal: kcal,
        protein: protein,
        fat: fat,
        carbo: carbo,
        created_at: time,
        updated_at: time
      }
  end
  Food.insert_all foods
end