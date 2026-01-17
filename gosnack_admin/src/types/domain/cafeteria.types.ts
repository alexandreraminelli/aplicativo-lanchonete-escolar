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

  /** Se a lanchonete está ativa. */
  isActive: boolean
  /** Data de criação da lanchonete no sistema. */
  createdAt: string
  /** Data da última atualização dos dados da lanchonete. */
  updatedAt: string
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
