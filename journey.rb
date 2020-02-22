require 'csv'

class EkiSampler

  LINE_CDS = [
    11302, # 11302,2,JR山手線,ヤマノテセン,JR山手線,,,,139.73522275686264,35.69302730762992,12,0,11302
    11313  # 11313,2,JR中央・総武線,チュウオウ・ソウブセン,JR中央・総武緩行線,,,,139.8371552268119,35.701641362335245,10,0,11313
  ].freeze

  def initialize
    @stations_csv = CSV.read('files/station20191227free.csv', headers: true)
  end

  # 運命を決める
  def destiny
    start_station_name = stations.sample['station_name']
    direction = directions.sample
    puts "あなたは今から#{start_station_name}駅から#{direction}方向に向います!!"
  end

  private

  # 動画の対象となる駅一覧
  #
  # @return [array] 駅一覧
  def stations
    target_stations = @stations_csv.select do |station_row|
      LINE_CDS.any? { |lid| station_row['line_cd'] == lid.to_s }
    end
  end

  # 行き先方面の一覧
  #
  # @return [array] 方向一覧
  def directions
    %w[
      上り
      下り
    ]
  end
end
