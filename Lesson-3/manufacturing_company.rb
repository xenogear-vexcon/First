module Manufacturing
  @company = ''
  def self.set_manufacturing_company(company)
    @company = company
  end
  def self.get_manufacturing_company
    @company
  end
end
