import { DayOfWeek, TimeSlot } from "@/types/times.types"

/** Modelo de dados para lanchonetes. */
export interface CafeteriaModel {
  /** ID da lanchonete no Firestore. */
  id: string
  /** Nome da lanchonete. */
  name: string
  /** Localização da lanchonete dentro da escola. */
  location: string
  /** Telefones de contato da lanchonete. */
  phones?: string[]
  /** Horários de funcionamento da lanchonete. */
  openingHours: OpeningHours[]
}

/** Modelo de dados para cadastro de lanchonete. */
export type CafeteriaInputModel = Omit<CafeteriaModel, "id">

/** Horário de funcionamento de uma lanchonete. */
export interface OpeningHours {
  /** Dia da semana. */
  dayOfWeek: DayOfWeek
  /** Horário de abertura (formato HH:mm). */
  openingTime: TimeSlot
  /** Horário de fechamento (formato HH:mm). */
  closingTime: TimeSlot
}
