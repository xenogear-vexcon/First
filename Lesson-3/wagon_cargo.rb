class CargoWagon < Wagon
  attr_reader :download, :unload
  MAX_WAGON_VOLUME = 100

  def initialize(volume = MAX_WAGON_VOLUME)
    super('cargo')
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
    raise 'Нечего разгружать' if (@unload - volume) < 0
    raise 'Перегруз!' if (@download + volume) > MAX_WAGON_VOLUME
  end
end
