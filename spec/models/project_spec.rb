require 'spec_helper'

describe Project do
  it { should have_many(:items) }

  describe '#done?' do
    let(:project) { Project.create!(name: 'test', description: 'test') }
    let(:item_closed) do
      Item.create!(description: 'Item closed 1',
                   opened: false,
                   project_id: project.id)
    end

    context 'when the project has items not closed' do
      let!(:item_opened) do
        Item.create!(description: 'Item opened 1',
                     opened: true,
                     project_id: project.id)
      end
      it 'returns false' do
        expect(project.done?).to be_false
      end
    end

    context 'when the project has all items closed' do
      let!(:item_closed_2) do
        Item.create!(description: 'Item closed 1',
                     opened: false,
                     project_id: project.id)
      end
      let(:result) { project.done? }

      it 'returns true' do
        expect(result).to be_true
      end
    end
  end

  describe '#items_by_days' do
    let(:project) { Project.create!(name: 'test', description: 'test') }
    let!(:item_today_1) do
      Item.create!(description: 'Item today 1',
                   opened: false,
                   project_id: project.id,
                   created_at: Time.now)
    end
    let!(:item_today_2) do
      Item.create!(description: 'Item today 2',
                   opened: false,
                   project_id: project.id,
                   created_at: Time.now)
    end
    let!(:item_yesterday_1) do
      Item.create!(description: 'Item yesterday 1',
        opened: false,
        project_id: project.id,
        created_at: 1.day.ago)
    end
    let!(:item_yesterday_2) do
      Item.create!(description: 'Item yesterday 2',
        opened: false,
        project_id: project.id,
        created_at: 1.day.ago)
    end

    let(:result) { project.items_by_days }
    it 'hash of items grouped by day' do
      expect(result[Time.now.to_date]).to eq([item_today_1, item_today_2])
      expect(result[(1.day.ago).to_date])
        .to eq([item_yesterday_1, item_yesterday_2])
    end

  end

  describe '#recent_items' do
    let(:project) { Project.create!(name: 'test', description: 'test') }
    let(:item_today) do
      Item.create!(description: 'Item today',
                   opened: false,
                   project_id: project.id,
                   created_at: Time.now)
    end
    let(:item_yesterday) do
      Item.create!(description: 'Item yesterday',
        opened: false,
        project_id: project.id,
        created_at: 1.day.ago)
    end

    let(:result) { project.recent_items }
    it 'hash of items grouped by day' do
      expect(result).to eq([item_today])
    end
  end
end
