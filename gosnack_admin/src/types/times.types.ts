/** Array dos literais de dias da semana. */
export const DAYS_OF_WEEK = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"] as const

/** Literais de dias da semana. */
export type DayOfWeek = (typeof DAYS_OF_WEEK)[number]
