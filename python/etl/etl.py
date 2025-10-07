def transform(legacy_data):
    return {letter.lower():points for points in legacy_data for letter in legacy_data[points]}
