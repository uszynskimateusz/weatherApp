//
//  Untitled.swift
//

final class AutocompleteCityMapper {
    func map(fromModel model: AutocompleteCityDTO) -> AutocompleteCity {
        AutocompleteCity(localizedName: model.localizedName,
                         key: model.key,
                         rank: model.rank)
    }
}
