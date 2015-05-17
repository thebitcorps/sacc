class Phone < ActiveRecord::Base
  KINDS = %w(casa oficina celular otro)
  belongs_to :client
  validates :kind, presence: true, inclusion: KINDS
end
