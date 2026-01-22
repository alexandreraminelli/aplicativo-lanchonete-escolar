import { cn } from "@/lib/utils"
import { HugeiconsIcon, IconSvgElement } from "@hugeicons/react"
import { ClassValue } from "clsx"

/**
 * Tipagem de um item de informação.
 */
export interface InfoItemType {
  /** Rótulo. */
  label: string
  /** Valor. */
  value: string
  /** Ícone. */
  icon?: IconSvgElement
}

/**
 * Props de `InfoList`.
 */
interface Props {
  /** Lista de informações. */
  infoList: InfoItemType[]

  /** Classes CSS adicionais. */
  className?: ClassValue
}

/**
 * Lista de blocos de informações.
 */
export default function InfoList({ infoList, className }: Props) {
  return (
    <dl className={cn("space-y-2 text-base", className)}>
      {infoList.map((info, index) => (
        <InfoBlock key={index} {...info} />
      ))}
    </dl>
  )
}

/**
 * Bloco de informação.
 */
export function InfoBlock({ label, value, icon }: InfoItemType) {
  return (
    <div className="flex items-center gap-2">
      {/* Ícone */}
      {icon && <HugeiconsIcon icon={icon} className="size-5" />}

      {/* Texto */}
      <p className="truncate text-ellipsis *:inline">
        <dt className="font-bold">{`${label}: `}</dt>
        <dd>{value}</dd>
      </p>
    </div>
  )
}
