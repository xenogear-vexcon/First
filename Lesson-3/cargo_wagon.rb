class CargoWagon < Wagon
  attr_reader :download, :unload
  MAX_WAGON_VOLUME = 100

  def initialize(number, volume = MAX_WAGON_VOLUME)
    @number = number
    @type = 'cargo'
    @download = 0
    @unload = volume
  end

  def change_load(weight)
    check_load!(weight)
    @download += weight
    @unload -= weight
  end

  def loaded
    @download
  end

  def free
    @unload
  end

  private

  def check_load!(weight)
    raise 'Перегруз!' if (@unload - weight) < 0
    raise 'Нечего разгружать!' if (@download + weight) > MAX_WAGON_VOLUME
  end
end
