//
//  MovieCollectionView.swift
//  AMtime
//
//  Created by Sherlock Zhao on 27/4/2024.
//

import SwiftUI

struct MovieCollectionView: UIViewRepresentable {
    var allItems: [HomeSection: [Codable]]
    var didSelectItem: ((_ indexPath: IndexPath) -> Void) = { _ in }
    var seeAllforSection: ((_ section: HomeSection) -> Void) = { _ in }

    func makeUIView(context: Context) -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: context.coordinator.createCompositionalLayout())
        collectionView.backgroundColor = .clear
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: TrendingCell.reuseId)
        collectionView.register(PopularCell.self, forCellWithReuseIdentifier: PopularCell.reuseId)
        collectionView.register(UpcomingCell.self, forCellWithReuseIdentifier: UpcomingCell.reuseId)
        collectionView.register(ActorCell.self, forCellWithReuseIdentifier: ActorCell.reuseId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId)
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }

    func updateUIView(_ collectionView: UICollectionView, context: Context) {
        // Update the collection view if needed
    }

    func makeCoordinator() -> MovieCollectionView.Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
        var parent: MovieCollectionView

        init(_ parent: MovieCollectionView) {
            self.parent = parent
        }

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return parent.allItems.count
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return parent.allItems[HomeSection.allCases[section]]?.count ?? 0
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            switch indexPath.section {
            case 0:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCell.reuseId, for: indexPath) as? TrendingCell {
                    cell.trending = parent.allItems[HomeSection.Trending]?[indexPath.item] as? Trending
                    return cell
                }
            case 1:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell.reuseId, for: indexPath) as? PopularCell {
                    cell.popular = parent.allItems[HomeSection.Popular]?[indexPath.item] as? Popular
                    return cell
                }

            case 2:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCell.reuseId, for: indexPath) as? UpcomingCell {
                    cell.upcoming = parent.allItems[HomeSection.Upcoming]?[indexPath.item] as? Upcoming
                    return cell
                }
            default:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCell.reuseId, for: indexPath) as? ActorCell {
                    cell.actor = parent.allItems[HomeSection.Actors]?[indexPath.item] as? Actor
                    return cell
                }
            }
            return UICollectionViewCell()
        }
        
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            switch kind {
            case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as? HeaderView else { return UICollectionReusableView() }
                header.name.text =  HomeSection.allCases[indexPath.section].rawValue
                header.onSeeAllClicked = { [weak self] in
                    self?.parent.seeAllforSection(HomeSection.allCases[indexPath.section])
                }
                return header
            default:
                 return UICollectionReusableView()
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            parent.didSelectItem(indexPath)
        }

        func createCompositionalLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { [weak self] index, _ in
                switch index {
                case 0:
                    return self?.createTrendingSection()
                case 1:
                    return self?.createSharedSection()
                case 2:
                    return self?.createUpcomingSection()
                default:
                    return self?.createSharedSection()
                }
            }
            let config = UICollectionViewCompositionalLayoutConfiguration()
            config.interSectionSpacing = 20
            layout.configuration = config
            return layout
        }

        func createTrendingSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
            layoutSection.boundarySupplementaryItems = [createSectionHeader()]
            return layoutSection
        }

        func createSharedSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalWidth(0.75))
            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
            layoutSection.boundarySupplementaryItems = [createSectionHeader()]
            return layoutSection
        }

        func createUpcomingSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalWidth(0.55))
            let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
            layoutSection.boundarySupplementaryItems = [createSectionHeader()]
            return layoutSection
        }

        func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
            let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            return layoutSectionHeader
        }
    }
}

//MARK: - Preview function
struct MovieCollectionViewPreview: View {
    // Sample data for the preview
    let sampleData: [HomeSection: [Codable]] = [
        .Trending: [Trending.default],
        .Popular: [Popular.default],
        .Upcoming: [Upcoming.default],
        .Actors: [Actor.default]
    ]

    var body: some View {
        MovieCollectionView(allItems: sampleData)
    }
}

struct MovieCollectionViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        MovieCollectionViewPreview()
    }
}
