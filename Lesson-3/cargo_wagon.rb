class CargoWagon < Wagon
  attr_reader :download, :unload
  MAX_WAGON_VOLUME = 100

  def initialize(number, volume = MAX_WAGON_VOLUME)
    @number = number
    @type = 'cargo'
    @download = 0
    @unload = volume
  end

  def change_load(volume)
    check_load!(volume)
    @download += volume
    @unload -= volume
  end

  private

  def check_load!
    if (@unload - volume) < 0
      raise 'Нечего разгружать'
    elsif (@download + volume) > MAX_WAGON_VOLUME
      raise 'Перегруз!'
    end
  end
end