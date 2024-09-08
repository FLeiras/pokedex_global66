export const capitalizeFirstLetter = (
  input: string | string[]
): string | string[] => {
  if (Array.isArray(input)) {
    return input.map((type) => {
      if (!type) return '';
      return type.charAt(0).toUpperCase() + type.slice(1).toLowerCase();
    });
  } else {
    if (!input) return '';
    return input.charAt(0).toUpperCase() + input.slice(1).toLowerCase();
  }
};
