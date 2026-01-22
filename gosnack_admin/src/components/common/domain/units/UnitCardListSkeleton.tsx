import UnitCardSkeleton from "./UnitCardSkeleton"

/** Skeleton do `UnitCardList`. */
export default function UnitCardListSkeleton() {
  // TODO: Implementar skeleton
  return (
    <section className="grid gap-4 grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
      {Array.from({ length: 8 }).map((_, index) => (
        <UnitCardSkeleton key={index} />
      ))}
    </section>
  )
}
